import 'package:designs/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCicularesPage extends StatefulWidget {
  const GraficasCicularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCicularesPage> createState() => _GraficasCicularesPageState();
}

class _GraficasCicularesPageState extends State<GraficasCicularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje += 10;
          if (porcentaje > 100) {
            porcentaje = 0;
          }
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.blue,
                ),
                _CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.pink,
                ),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.green,
                ),
                _CustomRadialProgress(
                  porcentaje: porcentaje,
                  color:Colors.red),
              ]),
        ],
      ),
    );
  }
}

class _CustomRadialProgress extends StatelessWidget {
  const _CustomRadialProgress({
    Key? key,
    required this.porcentaje,
    required this.color,
  }) : super(key: key);

  final Color color;

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: Colors.grey,
        grosorSecundario: 10,
        grosorPrimario: 4,
      ),
    );
  }
}