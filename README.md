# Magic Draw

![Cover - MagicDraw](https://raw.githubusercontent.com/signmotion/magic_draw/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/pub/v/magic_draw.svg?logo=dart&logoColor=00b9fc&color=blue)](https://pub.dartlang.org/packages/magic_draw)
[![Code Size](https://img.shields.io/github/languages/code-size/signmotion/magic_draw?logo=github&logoColor=white)](https://github.com/signmotion/magic_draw)
[![Publisher](https://img.shields.io/pub/publisher/magic_draw)](https://pub.dev/publishers/syrokomskyi.com)

[![Build Status](https://img.shields.io/github/actions/workflow/status/signmotion/magic_draw/flutter-ci.yml?logo=github-actions&logoColor=white)](https://github.com/signmotion/magic_draw/actions)
[![Pull Requests](https://img.shields.io/github/issues-pr/signmotion/magic_draw?logo=github&logoColor=white)](https://github.com/signmotion/magic_draw/pulls)
[![Issues](https://img.shields.io/github/issues/signmotion/magic_draw?logo=github&logoColor=white)](https://github.com/signmotion/magic_draw/issues)
[![Pub Score](https://img.shields.io/pub/points/magic_draw?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/magic_draw/score)

A widget for custom canvas with animated magic effects.
Feel free to use it in your awesome project.

Share some ❤️ and star repo to support the project.

## Usage

```dart
void initState() {
  super.initState();
  magic = MagicDraw();
  // init code, see `example/lib/main.dart`
}

late final MagicDraw magic;

Widget build(BuildContext context) => MaterialApp(
  home: Scaffold(
    body: SafeArea(child: magic),
  ),
);
```

[<img src="https://raw.githubusercontent.com/signmotion/magic_draw/master/images/screenshots/1.gif" width="600"/>](https://raw.githubusercontent.com/signmotion/magic_draw/master/images/screenshots/1.gif)

## Welcome

Requests and suggestions are warmly welcome.

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/magic_draw). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/magic_draw).

## TODO

- Detect a real mana position.
- Drawing a path.

Created [with ❤️](https://syrokomskyi.com)
