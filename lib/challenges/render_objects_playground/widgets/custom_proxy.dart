import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomProxy extends SingleChildRenderObjectWidget {
  const CustomProxy({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomProxy();
  }
}

class RenderCustomProxy extends RenderProxyBox {
  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    return false;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    canvas.saveLayer(offset & size, Paint()..blendMode = BlendMode.difference);
    context.paintChild(child!, offset);
    canvas.restore();
  }
}
