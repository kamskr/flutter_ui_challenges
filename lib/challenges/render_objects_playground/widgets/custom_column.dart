import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomColumn extends MultiChildRenderObjectWidget {
  CustomColumn({
    Key? key,
    this.alignment = CustomColumnAlignment.center,
    List<Widget> children = const [],
  }) : super(
          key: key,
          children: children,
        );

  final CustomColumnAlignment alignment;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomColumn(alignment: alignment);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderCustomColumn renderObject) {
    renderObject.alignment = alignment;
  }
}

enum CustomColumnAlignment {
  start,
  center,
}

class CustomColumnParentData extends ContainerBoxParentData<RenderBox> {
  int? flex;
}

class RenderCustomColumn extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, CustomColumnParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, CustomColumnParentData> {
  RenderCustomColumn({
    required CustomColumnAlignment alignment,
  }) : _alignment = alignment;

  CustomColumnAlignment get alignment => _alignment;
  CustomColumnAlignment _alignment;

  set alignment(CustomColumnAlignment value) {
    if (value == _alignment) return;
    _alignment = value;
    markNeedsLayout();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! CustomColumnParentData) {
      child.parentData = CustomColumnParentData();
    }
  }

  @override
  void performLayout() {
    size = _performLayout(
      constraints: constraints,
      dry: false,
    );

    RenderBox? child = firstChild;
    var childOffset = const Offset(0, 0);

    // In this loop, correct position of children is configured
    // Positioning children
    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;

      // Next child should start after previous ends basically
      double width = alignment == CustomColumnAlignment.center
          ? (size.width - child.size.width) / 2
          : 0;

      childParentData.offset = Offset(width, childOffset.dy);
      childOffset += Offset(width, child.size.height);

      child = childParentData.nextSibling;
    }
  }

  // Should always be implemented
  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _performLayout(constraints: constraints, dry: true);
  }

  // It is useful to define them. Checkout RenderFlex if you want to use it;
  @override
  double computeMinIntrinsicHeight(double width) {
    double height = 0;
    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;

      height += child.getMinIntrinsicHeight(width);

      child = childParentData.nextSibling;
    }

    return height;
  }

  // It is useful to define them. Checkout RenderFlex if you want to use it;
  @override
  double computeMaxIntrinsicHeight(double width) {
    double height = 0;
    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;

      height += child.getMaxIntrinsicHeight(width);

      child = childParentData.nextSibling;
    }

    return height;
  }

  // It is useful to define them. Checkout RenderFlex if you want to use it;
  @override
  double computeMinIntrinsicWidth(double height) {
    double width = 0;
    RenderBox? child = firstChild;

    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;
      width = min(width, child.getMinIntrinsicWidth(width));

      child = childParentData.nextSibling;
    }

    return height;
  }

  // It is useful to define them. Checkout RenderFlex if you want to use it;
  @override
  double computeMaxIntrinsicWidth(double height) {
    double width = 0;
    RenderBox? child = firstChild;

    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;
      width = max(width, child.getMaxIntrinsicWidth(width));

      child = childParentData.nextSibling;
    }

    return height;
  }

  Size _performLayout({
    required BoxConstraints constraints,
    required bool dry,
  }) {
    double width = 0, height = 0;
    int totalFlex = 0;
    RenderBox? lastFlexChild;

    RenderBox? child = firstChild;

    // Gather all the sizes needed for the column
    // Layout fixed height children
    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;
      final flex = childParentData.flex ?? 0;

      if (flex > 0) {
        totalFlex += flex;
        lastFlexChild = child;
      } else {
        late final Size childSize;
        if (!dry) {
          // To access size of the child it needs to first be configured by adding
          // constraints and in that case parentUsesSize: true
          child.layout(
            BoxConstraints(maxWidth: constraints.maxWidth),
            parentUsesSize: true,
          );
          childSize = child.size;
        } else {
          childSize = child
              .getDryLayout(BoxConstraints(maxWidth: constraints.maxWidth));
        }

        // What is needed at the end:
        // width => equal to the width of the widest child
        // height => equal to the sum of height of all the children
        width = max(width, childSize.width);
        height += childSize.height;
      }
      child = childParentData.nextSibling;
    }

    // Loop for calculating flex
    final remainingHeight = (constraints.maxHeight - height) / totalFlex;
    child = lastFlexChild;
    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;
      final flex = childParentData.flex ?? 0;

      if (flex > 0) {
        final childHeight = remainingHeight * flex;
        late final Size childSize;
        if (!dry) {
          child.layout(
            BoxConstraints(
              maxWidth: constraints.maxWidth,
              minHeight: childHeight,
              maxHeight: childHeight,
            ),
            parentUsesSize: true,
          );
          childSize = child.size;
        } else {
          childSize = child.getDryLayout(
            BoxConstraints(
              maxWidth: constraints.maxWidth,
              minHeight: childHeight,
              maxHeight: childHeight,
            ),
          );
        }

        height += childSize.height;
        width = max(childSize.width, width);
      }

      child = childParentData.previousSibling;
    }

    return Size(width, height);
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToFirstActualBaseline(baseline);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
