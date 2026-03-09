import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import admin from "npm:firebase-admin@11.10.1";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

// 🔐 Firebase init
const serviceAccount = JSON.parse(
  Deno.env.get("FIREBASE_SERVICE_ACCOUNT") || "{}"
);

if (!admin.apps.length) {
  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
  });
}

Deno.serve(async (req) => {
  try {
    if (req.method === "OPTIONS") {
      return new Response("ok", { headers: corsHeaders });
    }

    const authHeader = req.headers.get("Authorization");
    if (!authHeader) {
      return new Response("Unauthorized", { status: 401 });
    }

    // ✅ Client للتحقق من الأدمن
    const userClient = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_ANON_KEY") ?? "",
      { global: { headers: { Authorization: authHeader } } }
    );

    const {
      data: { user },
    } = await userClient.auth.getUser();

    if (!user) {
      return new Response("Unauthorized", { status: 401 });
    }

    const { data: profile } = await userClient
      .from("app_users")
      .select("is_admin")
      .eq("id", user.id)
      .single();

    if (!profile?.is_admin) {
      return new Response("Forbidden", { status: 403 });
    }

    // 🔑 Service Role Client
    const adminClient = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
    );

    const payload = await req.json();

    let title: string;
    let body: string;
    let imageUrl: string | null = null;
    let postId: string | null = null;

    // 📰 إشعار خبر
    if (payload.postId) {
      postId = payload.postId;

      const { data: post, error } = await adminClient
        .from("posts")
        .select("title, image_url, is_breaking, is_featured")
        .eq("id", postId)
        .single();

      if (error || !post) {
        throw error || new Error("Post not found");
      }

      title = post.is_breaking
        ? "🚨 خبر عاجل"
        : post.is_featured
        ? "⭐ خبر مميز"
        : "📰 خبر جديد";

      body = post.title;
      imageUrl = post.image_url;
    }

    // 📢 إشعار مخصص
    else if (payload.title && payload.body) {
      title = payload.title;
      body = payload.body;
      imageUrl = payload.imageUrl ?? null;
    }

    else {
      return new Response("Invalid payload", { status: 400 });
    }

    // 📱 جلب التوكنات
    const { data: devices } = await adminClient
      .from("devices")
      .select("fcm_token");

    const tokens = devices?.map((d) => d.fcm_token) ?? [];

    if (!tokens.length) {
      return new Response("No devices found");
    }

    // 🔔 بناء الرسالة
    const message = {
      tokens,
      notification: {
        title,
        body,
        ...(imageUrl && { imageUrl }),
      },
      android: {
        priority: "high",
        notification: {
          channelId: "basic_channel",
          priority: "max",
          defaultSound: true,
          defaultVibrateTimings: true,
          ...(imageUrl && { imageUrl }),
        },
      },
      data: {
        click_action: "FLUTTER_NOTIFICATION_CLICK",
        ...(postId && { postId }),
      },
    };

    const response = await admin
      .messaging()
      .sendEachForMulticast(message);

    // 💾 حفظ الإشعار في قاعدة البيانات
    await adminClient.from("notifications").insert({
      title,
      body,
      image_url: imageUrl,
      post_id: postId,
    });

    return new Response(
      JSON.stringify({
        success: true,
        sent: response.successCount,
        failed: response.failureCount,
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});