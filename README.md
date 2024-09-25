# Magic Draw

![SDK version](https://badgen.net/pub/sdk-version/magic_draw?style=for-the-badge)
![Supported platforms](https://badgen.net/pub/flutter-platform/magic_draw?style=for-the-badge)
![Supported SDKs](https://badgen.net/pub/dart-platform/magic_draw?style=for-the-badge)

![Cover - Magic Draw](https://raw.githubusercontent.com/signmotion/magic_draw/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/pub/v/magic_draw.svg?logo=dart&logoColor=00b9fc&color=blue&style=for-the-badge)](https://pub.dartlang.org/packages/magic_draw)
[![Code Size](https://img.shields.io/github/languages/code-size/signmotion/magic_draw?logo=github&logoColor=white&style=for-the-badge)](https://github.com/signmotion/magic_draw)
[![Publisher](https://img.shields.io/pub/publisher/magic_draw?style=for-the-badge)](https://pub.dev/publishers/syrokomskyi.com)

[![Build Status](https://img.shields.io/github/actions/workflow/status/signmotion/magic_draw/flutter-ci.yml?logo=github-actions&logoColor=white&style=for-the-badge)](https://github.com/signmotion/magic_draw/actions)
[![Pull Requests](https://img.shields.io/github/issues-pr/signmotion/magic_draw?logo=github&logoColor=white&style=for-the-badge)](https://github.com/signmotion/magic_draw/pulls)
[![Issues](https://img.shields.io/github/issues/signmotion/magic_draw?logo=github&logoColor=white&style=for-the-badge)](https://github.com/signmotion/magic_draw/issues)
[![Pub Score](https://img.shields.io/pub/points/magic_draw?logo=dart&logoColor=00b9fc&style=for-the-badge)](https://pub.dev/packages/magic_draw/score)

A widget for custom canvas with animated magic effects.
Feel free to use it in your awesome project.

[![CodeFactor](https://codefactor.io/repository/github/signmotion/magic_draw/badge?style=for-the-badge)](https://codefactor.io/repository/github/signmotion/magic_draw)

Share some ❤️ and star repo to support the [Magic Draw](https://github.com/signmotion/magic_draw).

_If you write an article about **MagicDraw** or any of [these](https://pub.dev/packages?q=publisher%3Asyrokomskyi.com&sort=updated) packages, let me know and I'll post the URL of the article in the **README**_ 🤝

## 🚀 Usage

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

## ✨ What's New

Look at [changelog](https://pub.dev/packages/magic_draw/changelog).

## 👋 Welcome

If you encounter any problems, feel free to [open an issue](https://github.com/signmotion/magic_draw/issues). If you feel the package is missing a feature, please [raise a ticket](https://github.com/signmotion/magic_draw/issues) on Github and I'll look into it. Requests and suggestions are warmly welcome. Danke!

Contributions are what make the open-source community such a great place to learn, create, take a new skills, and be inspired.

If this is your first contribution, I'll leave you with some of the best links I've found: they will help you get started or/and become even more efficient.

- [Guide to Making a First Contribution](https://github.com/firstcontributions/first-contributions). You will find the guide in your native language.
- [How to Contribute to Open Source](https://opensource.guide/how-to-contribute). Longread for deep diving for first-timers and for veterans.
- [Summer Guide from Google](https://youtu.be/qGTQ7dEZXZc).
- [CodeTriangle](https://codetriage.com). Free community tools for contributing to Open Source projects.

The package **MagicDraw** is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/magic_draw). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/magic_draw).

And here is a curated list of how you can help:

- Documenting the undocumented. Whenever you come across a class, property, or method within our codebase that you're familiar with and notice it lacks documentation, kindly spare a couple of minutes to jot down some helpful notes for your fellow developers.
- Refining the code. While I'm aware it's primarily my responsibility to refactor the code, I wholeheartedly welcome any contributions you're willing to make in this area. Your insights and improvements are appreciated!
- Constructive code reviews. Should you discover a more efficient approach to achieve something, I'm all ears. Your suggestions for enhancement are invaluable.
- Sharing your examples. If you've experimented with our use cases or have crafted some examples of your own, feel free to add them to the `example` directory. Your practical insights can enrich our resource pool.
- Fix typos/grammar mistakes.
- Report bugs and scenarios that are difficult to implement.
- Implement new features by making a pull-request.

## ✅ TODO (perhaps)

Once you start using the **MagicDraw**, it will become easy to choose the functionality to contribute. But if you already get everything you need from this package but have some free time, let me write here what I have planned:

- Detect a real mana position.
- Drawing a path.

It's just a habit of mine: writing down ideas that come to mind while working on a project. I confess that I rarely return to these notes. But now, hopefully, even if you don't have an idea yet, the above notes will help you choose the suitable "feature" and become a contributor to the open-source community.

Ready [for 🪙](https://webduet.de "The Modern Planet-Scale Site for Your Ambitions")

Created [with ❤️](https://syrokomskyi.com "Andrii Syrokomskyi")

[![fresher](https://img.shields.io/badge/maintained%20using-fresher-darkgreen.svg?style=for-the-badge)](https://github.com/signmotion/fresher "Keeps Projects Up to Date")
