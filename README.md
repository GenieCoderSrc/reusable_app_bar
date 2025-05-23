# reusable_app_bar

A customizable Flutter package for building advanced AppBar UIs. The `reusable_app_bar` package provides pre-built AppBar widgets with enhanced capabilities such as background images, positioned avatars, flexible layouts, and animated transitions, all of which make it easy to build beautiful and consistent application headers.

## Features

- 🧩 Modular AppBar components
- 👤 Support for profile avatars (including middle-bottom positioned avatars)
- 🎨 Custom background colors and images
- 🔄 Flexible layouts with `Stack` and `FlexibleSpaceBar`
- 🔍 Integrated search field AppBar with toggle functionality
- 🎛️ Option menu support with icons

## Getting Started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  reusable_app_bar: latest
```

Import the package:

```dart
import 'package:reusable_app_bar/reusable_app_bar.dart';
```

## Usage

### Simple App Bar
```dart
AppSimpleAppBar(
  titleTxt: 'Home',
  centerTitle: true,
  bgColor: Colors.blue,
  actions: [
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
  ],
)
```

### Profile App Bar with Bottom Avatar
```dart
BottomMiddleProfileRoundedAppBar(
  titleTxt: 'Profile',
  img: File('path/to/image'),
  imgRadius: 40.0,
)
```

### Scaffold with Background and Avatar
```dart
BottomMiddleAvatarScaffold(
  titleTxt: 'Dashboard',
  bgImageSource: 'https://example.com/background.jpg',
  imageSource: 'https://example.com/avatar.png',
  body: YourBodyWidget(),
)
```

## Widgets Included

- `AppSimpleAppBar`
- `BottomMiddleProfileRoundedAppBar`
- `BottomMiddleAvatarScaffold`
- `AppPopupMenuButton`
- `AppSearchField`
- `AppCircleAvatar`

## Customization Options

All app bars support advanced customization such as:
- Title widget or text
- Leading icon/button
- Actions list
- Avatar position & style
- Background customization
- Elevation and radius

## License

MIT License

---
Made with ️ by Shohidul Islam  https://github.com/GenieCoderSrc/reusable_app_bar
