# Changelog

All notable changes to this project will be documented in this file.

## 0.0.2
### Jul 15, 2025

### ✨ Added
- `StackedAppBar`: Stack-based flexible app bar with support for overlay widgets such as avatar, buttons, or any custom widgets.
- `StackedAvatarAppBar`: Specialized app bar supporting an overlaid avatar with extensive customization (radius, position, background, etc.).
- `BottomMiddleAvatarTabbedScaffold`: Enhanced version of `BottomMiddleAvatarScaffold` with built-in support for `TabBar` and `TabBarView`, enabling tabbed content layout under avatar-based headers.

### ♻️ Refactored
- Unified naming conventions across all app bar classes (`leading` → `leadingWidget`, `actionsList` → `actions`, `bgColor` → `backgroundColor`, etc.).
- Improved parameter naming for avatar positioning (`avatarTop`, `avatarLeft`, `avatarRight`, `avatarBottom`) and image configuration (`imageSource`, `imgBgColor`, `imgRadius`).
- Improved `BottomMiddleAvatarScaffold` layout and removed commented/unused code for cleaner structure and maintainability.

### ✅ Improved
- Better default values and null-safety for customizable parameters like `radius`, `alignment`, and `text style`.
- Center alignment logic for avatar and title widgets.
- Extended all custom app bars to implement `PreferredSizeWidget` properly, making them usable in the `appBar` parameter of `Scaffold`.

---

## 0.0.1
### Initial release
- Introduced the `reusable_app_bar` package with the following features:
  - `AppSimpleAppBar` for simple customizable app bars
  - `BottomMiddleProfileRoundedAppBar` for app bars with a bottom-positioned avatar
  - `BottomMiddleAvatarScaffold` for a scaffold with a background and middle-bottom avatar
  - `AppPopupMenuButton` for easy implementation of a popup menu
  - `AppSearchField` to add a search field with toggle functionality
  - `AppCircleAvatar` for displaying an avatar with custom image sources and styling

### Customization options:
- Title text or widget
- Leading icon or widget
- Action list support
- Avatar position and style customization
- Background color or image support
- Elevation and radius customization
