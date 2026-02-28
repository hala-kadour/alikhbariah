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

    const { title, body } = await req.json();

    if (!title || !body) {
      return new Response("Missing title or body", { status: 400 });
    }

    const authHeader = req.headers.get("Authorization");

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_ANON_KEY") ?? "",
      { global: { headers: { Authorization: authHeader! } } }
    );

    // 📱 جلب كل التوكنات
    const { data, error } = await supabase
      .from("devices")
      .select("fcm_token");

    if (error) {
      throw error;
    }

    const tokens = data.map((d) => d.fcm_token);

    if (!tokens.length) {
      return new Response("No devices found");
    }

   const message = {
         tokens,
         notification: {
         title,
         body,
         },
         android: {
           priority: "high",
           notification: {
                channelId: "basic_channel",
                priority: "max",
                defaultSound: true,
                defaultVibrateTimings: true,
              },
          },
         data: {
            channelKey: "basic_channel",
            click_action: "FLUTTER_NOTIFICATION_CLICK",
           },
    };

    const response = await admin.messaging().sendEachForMulticast(message);

    return new Response(
      JSON.stringify({
        success: true,
        sent: response.successCount,
        failed: response.failureCount,
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});