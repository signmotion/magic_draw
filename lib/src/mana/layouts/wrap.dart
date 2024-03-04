part of '../bloc.dart';

class WrapManaLayout extends ManaLayout {
  const WrapManaLayout();

  @override
  Widget build(BuildContext context, ManaPool pool) {
    final screenSize = MediaQuery.of(context).size;
    final (width, height) = (
      screenSize.width / 12,
      screenSize.height / 12 * screenSize.aspectRatio,
    );

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
                ),
      ],
    );
  }
}
