import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomColumn extends MultiChildRenderObjectWidget {
  CustomColumn({
    Key? key,
    List<Widget> children = const [],
  }) : super(
          key: key,
          children: children,
        );

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomColumn();
  }
}

class CustomColumnParentData extends ContainerBoxParentData<RenderBox> {
  int? flex;
}

class RenderCustomColumn extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, CustomColumnParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, CustomColumnParentData> {
  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! CustomColumnParentData) {
      child.parentData = CustomColumnParentData();
    }
  }

  @override
  void performLayout() {
    double width = 0, height = 0;
    int totalFlex = 0;
    RenderBox? lastFlexChild;

    RenderBox? child = firstChild;

    // Gather all the sizes needed for the column
    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;
      final flex = childParentData.flex ?? 0;

      if (flex > 0) {
        totalFlex += flex;
        lastFlexChild = child;
      } else {
        // To access size of the child it needs to first be configured by adding
        // constraints and in that case parentUsesSize: true
        child.layout(
          BoxConstraints(maxWidth: constraints.maxWidth),
          parentUsesSize: true,
        );

        // What is needed at the end:
        // width => equal to the width of the widest child
        // height => equal to the sum of height of all the children
        width = max(width, child.size.width);
        height += child.size.height;
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

        child.layout(
          BoxConstraints(
            maxWidth: constraints.maxWidth,
            minHeight: childHeight,
            maxHeight: childHeight,
          ),
          parentUsesSize: true,
        );
        height += childHeight;
        width = max(child.size.width, width);
      }

      child = childParentData.previousSibling;
    }

    child = firstChild;
    var childOffset = Offset(0, 0);

    // In this loop, correct position of children is configured
    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;

      // Next child should start after previous ends basically
      childParentData.offset = Offset(0, childOffset.dy);
      childOffset += Offset(0, child.size.height);

      child = childParentData.nextSibling;
    }

    size = Size(width, height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
