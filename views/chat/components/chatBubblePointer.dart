import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class ChatBubblePointer extends CustomPainter {
  final Color fillColor;

  ChatBubblePointer({required this.fillColor});
  // convert degree to radians
  double degToRad({required double degree}) => degree * (math.pi / 180.0);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paintFill = Paint()
      ..color = this.fillColor
      ..style = PaintingStyle.fill;

    Paint _paintBorder = Paint()
      ..color = this.fillColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Path _borderPath = Path();
    Path _fillPath = Path();

    // top arc
    _borderPath.arcTo(Rect.fromLTWH(-11.0, -24.0, 16.0, 15.0), this.degToRad(degree: 30.0), this.degToRad(degree: 120.0), true);
    // bottom arc
    _fillPath.arcTo(Rect.fromLTWH(-5.0, -20.0, 16.0, 15.0), this.degToRad(degree: 10.0), this.degToRad(degree: 150.0), true);
    _fillPath.arcTo(Rect.fromLTWH(-10.0, -26.0, 28.0, 22.0), this.degToRad(degree: 50.0), this.degToRad(degree: 110.0), true);
    canvas.drawPath(_borderPath, _paintBorder);
    canvas.drawPath(_fillPath, _paintFill);
  }

}