import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedClock extends StatelessWidget {
  const AnimatedClock({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const AnimatedClock());

  @override
  Widget build(BuildContext context) {
    return const _AnimatedClockView();
  }
}

class _AnimatedClockView extends StatelessWidget {
  const _AnimatedClockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF51A3A3),
      appBar: AppBar(
        title: const Text('Clock'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const _Clock(),
    );
  }
}

class _Clock extends StatefulWidget {
  const _Clock({Key? key}) : super(key: key);

  @override
  State<_Clock> createState() => __ClockState();
}

class __ClockState extends State<_Clock> {
  @override
  initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 600,
        height: 600,
        child: CustomPaint(painter: _ClockPainter()),
      ),
    );
  }
}

class _ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY) / 2;

    /// Board of the clock
    var fillBrush = Paint()..color = const Color(0xFFD1D1D1);
    canvas.drawCircle(center, radius, fillBrush);

    /// Circle indicators
    var indicatorsBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 30;
    for (double i = 0; i < 360; i += 22.5) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180 - 90);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180 - 90);
      var x2 = centerX + innerCircleRadius * cos(i * pi / 180 - 90);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180 - 90);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), indicatorsBrush);
    }

    // Numbers
    // const textStyle = TextStyle(
    //   color: Colors.black,
    //   fontSize: 30,
    // );

    // void drawText(String text, Offset offset) {
    //   final textSpan = TextSpan(
    //     text: text,
    //     style: textStyle,
    //   );
    //   final textPainter = TextPainter(
    //     text: textSpan,
    //     textDirection: TextDirection.ltr,
    //     textAlign: TextAlign.center,
    //   );
    //   textPainter.layout(
    //     minWidth: 0,
    //     maxWidth: size.width,
    //   );
    //   textPainter.paint(canvas, offset);
    // }

    // var counter = 1;
    // var numberDistance = 100;

    // for (double i = 0; i < 360; i += 30) {
    //   var x = centerX + numberDistance * cos(i * pi / 180 - 90) - 10;
    //   var y = centerY + numberDistance * sin(i * pi / 180 - 90);
    //   drawText('$counter', Offset(x, y));
    //   counter++;
    // }

    /// Outline of the clock
    var outlineBrush = Paint()
      ..color = const Color(0xFF3B3561)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(center, radius, outlineBrush);

    /// Hour arrow
    var hourArrowBrush = Paint()
      ..color = const Color(0xFFDD7373)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 15;

    var hourArrowLength = 80;
    var hourArrowX = centerX +
        hourArrowLength *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180 - 90);
    var hourArrowY = centerX +
        hourArrowLength *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180 - 90);

    canvas.drawLine(center, Offset(hourArrowX, hourArrowY), hourArrowBrush);

    /// Minute arrow
    var minuteArrowBrush = Paint()
      ..color = const Color(0xFF7E5A9B)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    var minArrowLength = 100;
    var minArrowX =
        centerX + minArrowLength * cos(dateTime.minute * 6 * pi / 180 - 90);
    var minArrowY =
        centerX + minArrowLength * sin(dateTime.minute * 6 * pi / 180 - 90);

    canvas.drawLine(center, Offset(minArrowX, minArrowY), minuteArrowBrush);

    /// Second arrow
    var secondArrowBrush = Paint()
      ..color = const Color(0xFFEAD94C)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    var secArrowLength = 120;
    var secArrowX =
        centerX + secArrowLength * cos(dateTime.second * 6 * pi / 180 - 90);
    var secArrowY =
        centerX + secArrowLength * sin(dateTime.second * 6 * pi / 180 - 90);
    canvas.drawLine(center, Offset(secArrowX, secArrowY), secondArrowBrush);

    /// Center dot
    var centerDotBrush = Paint()..color = const Color(0xFF3B3561);
    canvas.drawCircle(center, 15, centerDotBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
