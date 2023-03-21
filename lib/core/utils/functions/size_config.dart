import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenHeight, wPercent, hPercent, screenWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    //Define o tamanho da tela do dispositivo
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;

    //Define a porcentagem do tamamanho da tela
    wPercent = screenWidth! / 100;
    hPercent = screenHeight! / 100;
  }

  static double hp(y) => y * hPercent;

  static double wp(x) => x * wPercent;
}

percentW(x) => SizeConfig.wp(x);
percentH(y) => SizeConfig.hp(y);
