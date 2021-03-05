library crypto_font_icons;

import 'package:flutter/widgets.dart';

class CryptoFontIconData extends IconData {
  const CryptoFontIconData(final int codePoint)
      : super(
          codePoint,
          fontFamily: 'CryptoFont',
          fontPackage: 'crypto_font_icons',
        );
}
