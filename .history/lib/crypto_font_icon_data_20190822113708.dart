library crypto_font_icons;

import 'package:flutter/widgets.dart';

class CryptoFontIconData extends IconData {
  const CryptoFontIconData(int codePoint)
      : super(
          codePoint,
          fontFamily: 'CryptoFont',
          fontPackage: 'cryptocoins_icons',
        );
}
