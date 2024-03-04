part of '../bloc.dart';

class WrapManaLayout extends ManaLayout {
  const WrapManaLayout();

  @override
  Widget build(BuildContext context, ManaPool pool) {
    final (width, height) = sphereSize(context);

    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        for (var i = 0; i < pool.data.length; ++i)
          pool.data[i] == null
              ? SizedBox(
                  width: width,
                  height: height,
                )
              : WrappedSphere(
                  data: pool.data[i]!,
                  width: width,
                  height: height,
                )
                  .animate()
                  .fadeIn(
                    duration: (1200 * 3 / 2).ms,
                    curve: Curves.easeInSine,
                  )
                  .move(
                    begin: Offset(0, height * 4),
                    end: const Offset(0, 0),
                    duration: 1200.ms,
                    curve: Curves.easeInSine,
                  ),
      ],
    );
  }
}
