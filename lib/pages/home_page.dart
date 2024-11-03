import 'package:flutter/material.dart';
import 'dart:math'; // Importar dart:math para usar sin y cos

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: FlorDeLaVidaPainter(),
          ),
        ),
      ),
    );
  }
}

class FlorDeLaVidaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final double radius = size.width / 7; // Tamaño de cada círculo

    // Centro del dibujo
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Función para dibujar un círculo en una posición específica
    void drawCircle(Offset offset) {
      canvas.drawCircle(offset, radius, paint);
    }

    // Dibuja los círculos en el patrón de la Flor de la Vida
    drawCircle(center); // Círculo central

    // Círculos alrededor del central
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60) * pi / 180; // Convierte a radianes
      final Offset offset = Offset(
        center.dx + radius * 2 * cos(angle),
        center.dy + radius * 2 * sin(angle),
      );
      drawCircle(offset);
    }

    // Segundo anillo de círculos
    for (int i = 0; i < 6; i++) {
      final angle1 = (i * 60) * pi / 180;
      final Offset firstOffset = Offset(
        center.dx + radius * 2 * cos(angle1),
        center.dy + radius * 2 * sin(angle1),
      );

      for (int j = 0; j < 6; j++) {
        final angle2 = (j * 60) * pi / 180;
        final Offset secondOffset = Offset(
          firstOffset.dx + radius * 2 * cos(angle2),
          firstOffset.dy + radius * 2 * sin(angle2),
        );
        drawCircle(secondOffset);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
