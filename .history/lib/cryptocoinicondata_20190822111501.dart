library cryptocoins_icons;

import 'package:flutter/widgets.dart';


class CryptoCoinIconData extends IconData{
  const CryptoCoinIconData(int codePoint) : 
  super(
    codePoint,
    fontFamily: 'CryptoCoins',
    fontPackage: 'cryptocoins_icons',
  );
}