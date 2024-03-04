import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:magic_draw/magic_draw.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    md = MagicDraw();

    md.backgroundBloc.add(
      SetContentBackgroundEvent(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            key: UniqueKey(),
            'assets/images/castle_1024x.webp',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    md.manaBloc
      ..add(const SetLayoutManaEvent(layout: WrapManaLayout()))
      ..add(const SetNumberManaEvent(number: 64))
      ..add(const FillManaEvent(count: 12));
    Timer.periodic(
      2100.ms,
      (timer) {
        if (md.manaBloc.state.pool.filledCells().length <
            md.manaBloc.state.limitCount) {
          md.manaBloc.add(const FillManaEvent());
        }
      },
    );

    md.aimBloc.add(
      SetTapEffectAimEvent(
        effectBuilder: ({
          required double width,
          required double height,
        }) =>
            Image.asset(
          key: UniqueKey(),
          'assets/images/spheres/blue.webp',
          fit: BoxFit.cover,
          width: width,
          height: height,
        ).animate().fadeOut(duration: 1200.ms),
      ),
    );
  }

  late final MagicDraw md;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.black,
          body: SafeArea(
            maintainBottomViewPadding: true,
            child: md,
          ),
        ),
        debugShowCheckedModeBanner: false,
      );
}
