# reusable_app_bar

A customizable Flutter package for building advanced AppBar UIs. The `reusable_app_bar` package provides pre-built AppBar widgets with enhanced capabilities such as background images, positioned avatars, flexible layouts, and animated transitions, all of which make it easy to build beautiful and consistent application headers.

## Features

* 🧩 Modular AppBar components
* 👤 Support for profile avatars (including middle-bottom positioned avatars)
* 🧱 Stack-based and flexible layouts with support for overlays
* 🎨 Custom background colors and images
* 🔍 Integrated search field AppBar with toggle functionality
* 🎛️ Popup menu and tabbed content support


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

## Usage Examples

### ✅ Simple App Bar

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

### 👤 Profile App Bar with Bottom Avatar

```dart
RoundedProfileAvatarAppBar(
  title: 'Profile',
  imageSource: 'path/to/image',
  imgRadius: 40.0,
)
```

### 🧱 Scaffold with Background and Avatar

```dart
BottomMiddleAvatarScaffold(
  titleTxt: 'Dashboard',
  bgImageSource: 'https://example.com/background.jpg',
  imageSource: 'https://example.com/avatar.png',
  body: YourBodyWidget(),
)
```

### 🧩 Stack-based App Bar with Avatar

```dart
StackedAvatarAppBar(
  title: 'Profile',
  avatarImage: 'https://example.com/avatar.jpg',
  avatarRadius: 36.0,
  borderRadius: 24.0,
  backgroundColor: Colors.teal,
)
```

### 🔍 Searchable App Bar

```dart
SearchableTopTitleSubTitleProfileAppBar(
  titleTxt: 'Welcome',
  subTitleTxt: 'Search your items',
  searchField: AppSearchField(),
  imageSource: 'https://example.com/avatar.png',
)
```

## Widgets Included

* `AppSimpleAppBar`
* `BottomMiddleProfileRoundedAppBar`
* `BottomMiddleAvatarScaffold`
* `StackedAppBar`
* `StackedAvatarAppBar`
* `SearchableTopTitleSubTitleProfileAppBar`
* `TitleSubTitleProfileAppBar`
* `AppPopupMenuButton`
* `AppSearchField`
* `AppCircleAvatar`

## Customization Options

All app bars support:

* Title text or custom widget
* Leading icon or widget
* Action buttons or widgets
* Avatar position, style, and radius
* Background color and image with opacity
* Radius and elevation control
* Overlay widgets and tabbed body support

## License

MIT License

---

Made with ❤️ by [Shohidul Islam](https://github.com/GenieCoderSrc/reusable_app_bar)
