import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double scaleFactor;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    scaleFactor = _mediaQueryData.textScaleFactor;

    if (screenWidth >= 600) {
      safeBlockHorizontal = safeBlockHorizontal - 2;
      safeBlockVertical = safeBlockVertical - 1.50;
    }
    print("screenWidth==>$screenWidth");
    print("screenHeight==>$screenHeight");
    print("blockSizeHorizontal==>$blockSizeHorizontal");
    print("blockSizeVertical==>$blockSizeVertical");
    print("safeBlockHorizontal==>$safeBlockHorizontal");
    print("safeBlockVertical==>$safeBlockVertical");
    print("textScaleFactor==>${_mediaQueryData.textScaleFactor}");
  }
}
