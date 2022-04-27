import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615abb),
    );
  }
}

class HeaderBoderRedondo extends StatelessWidget {
  const HeaderBoderRedondo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff615abb),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(65),
              bottomRight: Radius.circular(65))),
      height: 300,
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 1000,
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HearderDiagonal(),
      ),

      // color: const Color(0xff615abb),
    );
  }
}

class _HearderDiagonal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propiedades
    lapiz.color = const Color(0xff615abb);
    //stroke dibuja la linea
    lapiz.style = PaintingStyle.fill;

// fill dibuja todo el contenido
//    lapiz.style = PaintingStyle.fill;

    lapiz.strokeWidth = 2;

    final path = Path();
    //dibijar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);

    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangulo extends StatelessWidget {
  const HeaderTriangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 1000,
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HearderTriangular(),
      ),

      // color: const Color(0xff615abb),
    );
  }
}

class _HearderTriangular extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propiedades
    lapiz.color = const Color(0xff615abb);
    //stroke dibuja la linea
    lapiz.style = PaintingStyle.fill;

// fill dibuja todo el contenido
//    lapiz.style = PaintingStyle.fill;

    lapiz.strokeWidth = 2;

    final path = Path();
    //dibijar con el path y el lapiz
    // path.moveTo(0, size.height * 0.0);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // path.lineTo(0,size.height);

    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 1000,
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HearderPico(),
      ),

      // color: const Color(0xff615abb),
    );
  }
}

class _HearderPico extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propiedades
    lapiz.color = const Color(0xff615abb);
    //stroke dibuja la linea
    lapiz.style = PaintingStyle.fill;

    lapiz.strokeWidth = 2;

    final path = Path();
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.50, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.height, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 1000,
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvo(),
      ),

      // color: const Color(0xff615abb),
    );
  }
}

class _HeaderCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propiedades
    lapiz.color = const Color.fromARGB(255, 104, 90, 187);
    //stroke dibuja la linea
    lapiz.style = PaintingStyle.fill;

    lapiz.strokeWidth = 25;

    final path = Path();
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width , size.height * 0.25);

    // path.quadraticBezierTo(size.width *0.5, size.height * 0.40,size.width , size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 1000,
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWave(),
      ),

      // color: const Color(0xff615abb),
    );
  }
}

class _HeaderWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propiedades
    lapiz.color = const Color.fromARGB(255, 104, 90, 187);
    //stroke dibuja la linea
    lapiz.style = PaintingStyle.fill;

    lapiz.strokeWidth = 25;

    final path = Path();
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width , size.height * 0.25);
    // path.quadraticBezierTo(size.width *0.5, size.height * 0.40,size.width , size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave2 extends StatelessWidget {
  const HeaderWave2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 1000,
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWave2(),
      ),

      // color: const Color(0xff615abb),
    );
  }
}

class _HeaderWave2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propiedades
    lapiz.color = const Color.fromARGB(255, 104, 90, 187);
    //stroke dibuja la linea
    lapiz.style = PaintingStyle.fill;

    lapiz.strokeWidth = 25;

    final path = Path();
    // path.moveTo(0, size.height * 0.35);
    // path.lineTo(size.width * 0.35, size.height * 0.1);
    path.moveTo(0, size.height * 0.75);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.70,
        size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.80, size.width, size.height * 0.75);
    path.lineTo(size.width, size.height * 1);
    path.lineTo(0, size.height);

    // path.lineTo(size.width, size.height * 0.30);
    // path.lineTo(size.width , size.height * 0.25);
    // path.quadraticBezierTo(size.width *0.5, size.height * 0.40,size.width , size.height * 0.25);
    // path.quadraticBezierTo(size.width *0.25, size.height * 0.30,size.width *0.5 , size.height * 0.25);
    // path.quadraticBezierTo(size.width *0.75, size.height * 0.20,size.width , size.height * 0.25);
    // path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 1000,
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradient(),
      ),

      // color: const Color(0xff615abb),
    );
  }
}

class _HeaderWaveGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(0.0, 55.0), radius: 180);
    const Gradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA),
        ],
        stops: [
          0.4,
          0.5,
          1.0,
        ]);
    final lapiz = Paint()..shader = gradient.createShader(rect);

    lapiz.style = PaintingStyle.fill;

    lapiz.strokeWidth = 25;

    final path = Path();
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
