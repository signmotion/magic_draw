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

    magic = MagicDraw();

    magic.background.add(
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

    const n = 33;
    magic.mana
      ..add(const SetLayoutManaEvent(layout: WrapManaLayout()))
      ..add(const SetPoolSizeManaEvent(size: n))
      ..add(const FillManaEvent(count: n));
    timer = Timer.periodic(
      2100.ms,
      (timer) {
        if (!magic.mana.state.pool.isFilled) {
          magic.mana.add(const FillManaEvent());
        }
      },
    );

    magic.aim.add(
      SetTapEffectAimEvent(effectBuilder: ({
        required BuildContext context,
      }) {
        final (width, height) = sphereSize(context);
        return Sphere(
          data: SphereData(),
          width: width,
          height: height,
        ).animate().fadeOut(duration: 1200.ms, curve: Curves.easeInSine);
      }),
    );
  }

  late final MagicDraw magic;
  late final Timer timer;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.black,
          body: SafeArea(
            maintainBottomViewPadding: true,
            child: magic,
          ),
        ),
        debugShowCheckedModeBanner: false,
      );

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }
}
