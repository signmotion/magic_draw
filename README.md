# Magic Draw

![Cover - MagicDraw](https://raw.githubusercontent.com/signmotion/magic_draw/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/badge/doc-magic_draw-blue)](https://pub.dartlang.org/packages/magic_draw)
[![Build Status](https://github.com/signmotion/magic_draw/actions/workflows/dart-ci.yml/badge.svg)](https://github.com/signmotion/magic_draw/actions/workflows/dart-ci.yml)
[![Publisher](https://img.shields.io/pub/publisher/magic_draw)](https://pub.dev/publishers/syrokomskyi.com)

A widget for custom canvas with animated magic effects.
Feel free to use it in your awesome projects.

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

![Screenshot - MagicDraw](https://raw.githubusercontent.com/signmotion/magic_draw/master/images/screenshots/1.gif)

## Welcome

Requests and suggestions are warmly welcome.

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/magic_draw). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/magic_draw).

## TODO

- Drawing a path.
