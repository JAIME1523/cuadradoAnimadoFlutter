import 'package:flutter/material.dart';

class CuadradoAnimado extends StatelessWidget {
  const CuadradoAnimado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _CuadradoAnimado()),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> moverDercha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

//animaciones

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500));

    moverDercha = Tween(begin: 0.0, end: 130.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.bounceOut)));
    moverArriba = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));
    moverIzquierda = Tween(begin: 0.0, end: -130.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));
    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
      }
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
    controller.forward();
    return AnimatedBuilder(
      child: const _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return 
        Transform.translate(
          
          offset: Offset(moverDercha.value + moverIzquierda.value, moverArriba.value+moverAbajo.value),
          child: child,
          
        );
        
        // Transform.translate(
        //     offset: Offset(moverDercha.value, 0),
        //     child: Transform.translate(
        //         offset: Offset(0, moverArriba.value),
        //         child: Transform.translate(
        //             offset: Offset(moverIzquierda.value, 0),
        //             child: Transform.translate(
        //                 offset: Offset(0, moverAbajo.value), child: child))));
      },
      animation: controller,
    );
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
