import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'widgets.dart';

class CustomBox extends LeafRenderObjectWidget {
  const CustomBox({
    Key? key,
    required this.color,
    this.rotation = 0,
    this.flex = 0,
    this.onTap,
  })  : assert(rotation <= 2 * pi && rotation >= 0),
        super(key: key);
  final int flex;
  final Color color;
  final double rotation;
  final VoidCallback? onTap;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomBox(
      flex: flex,
      color: color,
      rotation: rotation,
      onTap: onTap,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderCustomBox renderObject,
  ) {
    renderObject
      ..flex = flex
      ..color = color
      ..rotation = rotation
      ..onTap = onTap;
  }
}

class RenderCustomBox extends RenderBox {
  RenderCustomBox({
    required int flex,
    required Color color,
    required double rotation,
    VoidCallback? onTap,
  })  : _flex = flex,
        _color = color,
        _rotation = rotation,
        _onTap = onTap;

  int get flex => _flex;
  int _flex;

  set flex(int value) {
    assert(value >= 0);
    if (value == _flex) return;

    parentData!.flex = value;
    _flex = value;

    markParentNeedsLayout();
  }

  Color get color => _color;
  Color _color;

  set color(Color value) {
    if (value == _color) return;

    _color = value;

    markNeedsPaint();
  }

  double get rotation => _rotation;
  double _rotation;

  set rotation(double value) {
    if (value == _rotation) return;

    _rotation = value;

    markNeedsPaint();
  }

  VoidCallback? get onTap => _onTap;
  VoidCallback? _onTap;

  set onTap(VoidCallback? value) {
    if (value == _onTap) return;

    _onTap = value;
    _tapGestureRecognizer.onTap = value;
  }

// Without this param set to true, the whole widget tree will
// be updated on animation
  // @override
  // bool get isRepaintBoundary => true;

  @override
  CustomColumnParentData? get parentData {
    if (super.parentData == null) {
      return null;
    }
    assert(super.parentData is CustomColumnParentData,
        '$CustomBox can only be a direct child of a $CustomColumn,');

    return super.parentData as CustomColumnParentData;
  }

  late final TapGestureRecognizer _tapGestureRecognizer;
  late final LongPressGestureRecognizer _longPressGestureRecognizer;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    parentData!.flex = flex;
    _tapGestureRecognizer = TapGestureRecognizer(debugOwner: this)
      ..onTap = onTap;
    _longPressGestureRecognizer = LongPressGestureRecognizer(debugOwner: this)
      ..onLongPress = onTap;
  }

  @override
  void detach() {
    _tapGestureRecognizer.dispose();
    super.detach();
  }

  // Seo / accessibility
  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    config
      ..isButton = true
      ..textDirection = TextDirection.ltr
      ..hint = "Trigger spinning animation"
      ..onTap = onTap;
  }

  @override
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.biggest;
  }

  @override
  bool hitTestSelf(Offset position) {
    return size.contains(position);
  }

  @override
  void handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));

    if (event is PointerDownEvent) {
      _tapGestureRecognizer.addPointer(event);
      _longPressGestureRecognizer.addPointer(event);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    //  Fun here
    // // Clip rect cuts overflows; like in overflow: hidden;
    // context.pushClipRect(needsCompositing, offset, Offset.zero & size,
    //     (context, offset) {
    //   //Transform that applies to all children
    //   context.pushTransform(
    //       needsCompositing,
    //       offset,
    //       Matrix4.identity()
    //         ..rotateY(pi / 4)
    //         ..rotateX(pi / 4),
    //       (context, offset) {});
    // });

    // Draw background.
    final canvas = context.canvas;
    canvas.drawRect(offset & size, Paint()..color = color);

    //  Draw a small rectangle.

    final smallRectWidth = size.shortestSide / (3 - sin(rotation));

    canvas.save();
    canvas.translate(offset.dx + size.width / 2, offset.dy + size.height / 2);
    canvas.rotate(rotation);
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset.zero,
        width: smallRectWidth,
        height: smallRectWidth,
      ),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..color = const Color(0xff6a45df),
    );
    canvas.restore();
  }
}
