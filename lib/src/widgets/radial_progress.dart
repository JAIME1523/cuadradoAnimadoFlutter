// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  const RadialProgress({
    Key? key,
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.grosorSecundario = 4,
    this.grosorPrimario = 4,
  }) : super(key: key);
  final porcentaje;

  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double? porcentajeANterior;

  @override
  void initState() {
    porcentajeANterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 5500));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeANterior;

    porcentajeANterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress(
                  (widget.porcentaje - diferenciaAnimar) +
                      (diferenciaAnimar + controller.value),
                  widget.colorPrimario,
                  widget.colorSecundario,
                  widget.grosorSecundario,
                  widget.grosorPrimario),
              // child: ,
            ));
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario,
      this.grosorSecundario, this.grosorPrimario);
  @override
  void paint(Canvas canvas, Size size) {
    //Inico del gradiente
    final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);

    const Gradient gradient = LinearGradient(
      colors: <Color>[Color(0xffC012FF), Color(0xff6D05E8), Colors.red],
    );
    //final del gradiente

    //se define el la proiedad de lasprimer lines
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //Arco
    //se define los valores para dar color a la linea de completado
    final paintArco = Paint()
      ..strokeWidth = 10
      // ..color = colorPrimario
      //shader para el gradiente
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    double arcoAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcoAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
