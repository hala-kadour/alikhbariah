import 'package:flutter/cupertino.dart';

class AppColors {
  const AppColors._();

  //==================== Brand Colors ==============================//

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF0C0C0C);

  static const red50 = Color(0xFFFDE6E6);
  static const red100 = Color(0xFFFBCCCC);
  static const red200 = Color(0xFFF69999);
  static const red300 = Color(0xFFF26666);
  static const red400 = Color(0xFFEE3333);
  static const redDefault = Color(0xFFE90000);
  static const red600 = Color(0xFFBB0000);
  static const red700 = Color(0xFF8C0000);
  static const red800 = Color(0xFF5D0000);

  static const cyan50 = Color(0xFFE6F6F7);
  static const cyan100 = Color(0xFFCDEDEE);
  static const cyan200 = Color(0xFF9BDBDD);
  static const cyan300 = Color(0xFF68C9CB);
  static const cyan400 = Color(0xFF36B7BA);
  static const cyanDefault = Color(0xFF04A5A9);
  static const cyan600 = Color(0xFF038487);
  static const cyan700 = Color(0xFF026365);
  static const cyan800 = Color(0xFF024244);

  static const navy50 = Color(0xFFE6EBEF);
  static const navy100 = Color(0xFFCCD7DD);
  static const navy200 = Color(0xFF99AFBB);
  static const navy300 = Color(0xFF67879A);
  static const navy400 = Color(0xFF345F78);
  static const navyDefault = Color(0xFF013756);
  static const navy600 = Color(0xFF012C45);
  static const navy700 = Color(0xFF012134);
  static const navy800 = Color(0xFF001622);
  static const navy900 = Color(0xFF00121C);

  static const green50 = Color(0xFFE6FDE8);
  static const green100 = Color(0xFFCCF9D0);
  static const green200 = Color(0xFF99F4A1);
  static const green300 = Color(0xFF66EE71);
  static const green400 = Color(0xFF33E942);
  static const greenDefault = Color(0xFF00E313);
  static const green600 = Color(0xFF00B60F);
  static const green700 = Color(0xFF00880B);
  static const green800 = Color(0xFF005B08);

  static const blue50 = Color(0xFFE6ECFD);
  static const blue100 = Color(0xFFCCD8F9);
  static const blue200 = Color(0xFF99B1F4);
  static const blue300 = Color(0xFF668AEE);
  static const blue400 = Color(0xFF3363E9);
  static const blueDefault = Color(0xFF003DE3);
  static const blue600 = Color(0xFF0030B6);
  static const blue700 = Color(0xFF002488);
  static const blue800 = Color(0xFF00185B);

  static const orange50 = Color(0xFFFDF0E6);
  static const orange100 = Color(0xFFF9E0CC);
  static const orange200 = Color(0xFFF4C299);
  static const orange300 = Color(0xFFEEA366);
  static const orange400 = Color(0xFFE98533);
  static const orangeDefault = Color(0xFFE36600);
  static const orange600 = Color(0xFFB65200);
  static const orange700 = Color(0xFF883D00);
  static const orange800 = Color(0xFF5B2900);

  static const gray00 = Color(0xFFF5F5F5);
  static const gray50 = Color(0xFFEDEDEE);
  static const gray100 = Color(0xFFDADBDD);
  static const gray200 = Color(0xFFB4B6BB);
  static const gray300 = Color(0xFF8F9299);
  static const gray400 = Color(0xFF696D77);
  static const grayDefault = Color(0xFF444955);
  static const gray600 = Color(0xFF363A44);
  static const gray700 = Color(0xFF292C33);
  static const gray800 = Color(0xFF1B1D22);
  static const gray850 = Color(0xFF121416);
  static const gray900 = Color(0xFF0A0B0D);

  //==================== Alias Colors ==============================//
  static const primary50 = cyan50;
  static const primary100 = cyan100;
  static const primary200 = cyan200;
  static const primary300 = cyan300;
  static const primary400 = cyan400;
  static const primaryDefault = cyanDefault;
  static const primary600 = cyan600;
  static const primary700 = cyan700;
  static const primary800 = cyan800;

  static const secondary50 = navy50;
  static const secondary100 = navy100;
  static const secondary200 = navy200;
  static const secondary300 = navy300;
  static const secondary400 = navy400;
  static const secondaryDefault = navyDefault;
  static const secondary600 = navy600;
  static const secondary700 = navy700;
  static const secondary800 = navy800;
  static const secondary900 = Color(0xFF000F18);

  static const success50 = green50;
  static const success100 = green100;
  static const success200 = green200;
  static const success300 = green300;
  static const success400 = green400;
  static const successDefault = greenDefault;
  static const success600 = green600;
  static const success700 = green700;
  static const success800 = green800;

  static const error50 = red50;
  static const error100 = red100;
  static const error200 = red200;
  static const error300 = red300;
  static const error400 = red400;
  static const errorDefault = redDefault;
  static const error600 = red600;
  static const error700 = red700;
  static const error800 = red800;

  static const warning50 = orange50;
  static const warning100 = orange100;
  static const warning200 = orange200;
  static const warning300 = orange300;
  static const warning400 = orange400;
  static const warningDefault = orangeDefault;
  static const warning600 = orange600;
  static const warning700 = orange700;
  static const warning800 = orange800;

  static const info50 = blue50;
  static const info100 = blue100;
  static const info200 = blue200;
  static const info300 = blue300;
  static const info400 = blue400;
  static const infoDefault = blueDefault;
  static const info600 = blue600;
  static const info700 = blue700;
  static const info800 = blue800;

  static const neutral00 = gray00;
  static const neutral50 = gray50;
  static const neutral100 = gray100;
  static const neutral200 = gray200;
  static const neutral300 = gray300;
  static const neutral400 = gray400;
  static const neutralDefault = grayDefault;
  static const neutral600 = gray600;
  static const neutral700 = gray700;
  static const neutral800 = gray800;
  static const neutral850 = gray850;
  static const neutral900 = gray900;

  // Mapped Colors
  static const primaryLinear = LinearGradient(colors: [primary400, primary700]);

  //==================== For The Light Mode ==============================//

  static const textHeadingsLight = secondary800;
  static const textBodyLight = secondary300;
  static const textLabelLight = neutral300;
  static const textActionLight = primaryDefault;
  static const textOnActionLight = white;
  static const textDisabledLight = neutral400;
  static const textInfoLight = infoDefault;
  static const textWarningLight = warningDefault;
  static const textSuccessLight = successDefault;
  static const textErrorLight = errorDefault;

  static const iconsDefaultLight = secondary300;
  static const iconsActionLight = primaryDefault;
  static const iconsOnActionLight = white;
  static const iconsDisabledLight = neutral400;
  static const iconsInfoLight = infoDefault;
  static const iconsWarningLight = warningDefault;
  static const iconsSuccessLight = successDefault;
  static const iconsErrorLight = errorDefault;

  static const surfacePageLight = white;
  static const surfaceFieldLight = Color(0xFFF5F4F9);
  static const surfaceBrightLight = Color(0xFFF5F4F9);
  static const surfaceContainerLight = Color(0xFFF5F4F9);
  static const surfaceDisabledLight = neutral50;
  static const surfaceInfoLight = info50;
  static const surfaceWarningLight = warning50;
  static const surfaceSuccessLight = success50;
  static const surfaceErrorLight = error50;

  static const borderDefaultLight = neutral100;
  static const borderSuccessLight = success200;
  static const borderWarningLight = warning200;
  static const borderInfoLight = info200;
  static const borderErrorLight = error200;
  static const borderDisabledLight = neutral200;
  static const borderActionLight = primary200;
  static const borderFocusLight = primaryDefault;
  static const borderActionHoverLight = primary600;

  //==================== For The Dark Mode ==============================//
  static const textHeadingsDark = white;
  static const textBodyDark = secondary50;
  static const textLabelDark = neutral400;
  static const textActionDark = primaryDefault;
  static const textActionHoverDark = primary400;
  static const textOnActionDark = white;
  static const textDisabledDark = neutral400;
  static const textInfoDark = info400;
  static const textWarningDark = warning400;
  static const textSuccessDark = success400;
  static const textErrorDark = error400;

  static const iconsDefaultDark = secondary50;
  static const iconsActionDark = primaryDefault;
  static const iconsActionHoverDark = primary400;
  static const iconsOnActionDark = black;
  static const iconsDisabledDark = neutralDefault;
  static const iconsInfoDark = info400;
  static const iconsWarningDark = warning400;
  static const iconsSuccessDark = success400;
  static const iconsErrorDark = error300;

  static const surfacePageDark = secondary800;
  static const surfaceContainerDark = secondary700;
  static const surfaceFieldDark = secondary700;
  static const surfaceBrightDark = secondary600;
  static const surfaceDisabledDark = neutral700;
  static const surfaceInfoDark = info800;
  static const surfaceWarningDark = warning800;
  static const surfaceSuccessDark = success800;
  static const surfaceErrorDark = error800;

  static const borderDefaultDark = neutralDefault;
  static const borderSuccessDark = success600;
  static const borderWarningDark = warning600;
  static const borderInfoDark = info600;
  static const borderErrorDark = error600;
  static const borderDisabledDark = neutral600;
  static const borderActionDark = primaryDefault;
  static const borderFocusDark = primaryDefault;
  static const borderActionHoverDark = primary400;
}
