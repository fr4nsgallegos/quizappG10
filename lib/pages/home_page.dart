import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: PentagonoPainter(),
          ),
        ),
      ),
    );
  }
}

class PentagonoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.grey[300]!,
          Colors.grey[500]!,
          Colors.grey[700]!,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    double width = size.width;
    double height = size.height;

    path.moveTo(width * 0.5, 0);
    path.lineTo(width, height * 0.38);
    path.lineTo(width * 0.8, height);
    path.lineTo(width * 0.2, height);
    path.lineTo(0, height * 0.38);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
