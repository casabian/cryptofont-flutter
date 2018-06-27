# Cryptocoins Icons for Flutter

Making Cryptocoins available for Flutter.

Original project at [AllienWorks/cryptocoin](https://github.com/AllienWorks/cryptocoins)


## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
  cryptocoins_icons: 0.1.0
```


```dart
import 'package:cryptocoins_icons/cryptocoins_icons.dart';

class BtcIconButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return new IconButton(
      // Bitcoin
      icon: new Icon(CryptoCoinIcons.BTC), 
     );
  }
}