import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  const IconHeader(
      {Key? key,
      required this.icon,
      required this.titulo,
      required this.subtitulo,
      this.color1 = const Color(0xff526BF6),
      this.color2 = const Color(0xFF67ACF2)})
      : super(key: key);

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(children: [
      _IconHeaderBackground(
        color1: color1,
        color2: color2,
      ),
      Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          )),
      Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Text(subtitulo, style: TextStyle(fontSize: 20, color: colorBlanco)),
          const SizedBox(
            height: 20,
          ),
          Text(titulo,
              style: TextStyle(
                  fontSize: 20,
                  color: colorBlanco,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          FaIcon(
            icon,
            size: 80,
            color: Colors.white,
          )
        ],
      )
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 300,
        decoration:  BoxDecoration(
            // color: Colors.red,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color1,
                  color2,
                ])));
  }
}
