import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'widgets.dart';

class CustomBox extends LeafRenderObjectWidget {
  const CustomBox({
    Key? key,
    required this.color,
    this.flex = 0,
  }) : super(key: key);
  final int flex;
  final Color color;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomBox(flex: flex, color: color);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderCustomBox renderObject,
  ) {
    renderObject
      ..flex = flex
      ..color = color;
  }
}

class RenderCustomBox extends RenderBox {
  RenderCustomBox({
    required int flex,
    required Color color,
  })  : _flex = flex,
        _color = color;

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

  @override
  CustomColumnParentData? get parentData {
    if (super.parentData == null) {
      return null;
    }
    assert(super.parentData is CustomColumnParentData,
        '$CustomBox can only be a direct child of a $CustomColumn,');

    return super.parentData as CustomColumnParentData;
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    parentData!.flex = flex;
  }

  @override
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.biggest;
  }
}
