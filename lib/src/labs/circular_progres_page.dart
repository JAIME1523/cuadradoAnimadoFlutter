import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgessPage extends StatefulWidget {
  const CircularProgessPage({Key? key}) : super(key: key);

  @override
  State<CircularProgessPage> createState() => _CircularProgessPageState();
}

class _CircularProgessPageState extends State<CircularProgessPage>
    with SingleTickerProviderStateMixin {
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    controller.addListener(() {
      // print('calor del controller ${controller.value}');

      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            porcentaje = nuevoPorcentaje;
            nuevoPorcentaje += 10;
            if (nuevoPorcentaje > 100) {
              nuevoPorcentaje = 0;
              porcentaje = 0;
            }
            controller.forward(from: 0.0);
            setState(() {});
          },
          child: const Icon(Icons.refresh),
          backgroundColor: Colors.pink,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 100,
            width: 100,
            child: CustomPaint(
              painter: _MiRadialProgress(porcentaje),
            ),
          ),
        ));
  }
}

class _MiRadialProgress extends CustomPainter {
  // ignore: prefer_typing_uninitialized_variables
  final porcentaje;
  _MiRadialProgress(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {
    //se define el la proiedad de lasprimer lines
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //Arco
    //se define los valores para dar color a la linea de completado
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;
    double arcoAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcoAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
