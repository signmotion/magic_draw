part of '../share.dart';

extension GlobalKeyExt on GlobalKey {
  /// Returns a global bounds as [Rect].
  Rect? get globalPaintBounds {
    final render = currentContext?.findRenderObject();
    final translation = render?.getTransformTo(null).getTranslation();
    if (translation != null && render?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return render!.paintBounds.shift(offset);
    }

    return null;
  }
}
