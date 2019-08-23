# CryptoFont Icons for Flutter

Bringing @AMPoellmann's CryptoFont to Flutter

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
crypto_font_icons: 0.1.0
```

## Usage

```dart
import 'package:crypto_font_icons/crypto_font_icons.dart';

class IconButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return new IconButton(
      // Bitcoin
      icon: new Icon(CryptoFontIcons.BTC),
     );
  }
}
```

## Attribution

CryptoFont by @AMPoellmann - https://cryptofont.com
https://github.com/AlexanderPoellmann/CryptoFont
