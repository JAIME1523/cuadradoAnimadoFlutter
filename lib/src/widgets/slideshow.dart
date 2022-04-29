import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  const SlideShow(
      {Key? key,
      required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12,
      this.bulletSecundario = 12})
      : super(key: key);
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SliderModel>(context).colorPrimario = colorPrimario;
            Provider.of<_SliderModel>(context).colorSecundario =
                colorSecundario;

            Provider.of<_SliderModel>(context).bulletSecundario =
                bulletSecundario;
            Provider.of<_SliderModel>(context).bulletPrimario = bulletPrimario;

            return Column(children: [
              if (puntosArriba)
                _Dots(
                  valor: slides.length,
                ),
              Expanded(
                  child: _Slides(
                slides: slides,
              )),
              if (!puntosArriba)
                _Dots(
                  valor: slides.length,
                ),

              // _Dots(
              //   valor: slides.length,
              // ),
            ]);
          },
        )),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    Key? key,
    required this.valor,
  }) : super(key: key);
  final int valor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: null,
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //List.generate permite generate un alista dentro deunn Row
        children: List.generate(
            valor,
            (index) => _Dot(
                  index: index,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final sslidemodel = Provider.of<_SliderModel>(context);
double tamano;
Color color;

if (sslidemodel.currentPage >= index - 0.5 &&
                  sslidemodel.currentPage < index + 0.5){
tamano =sslidemodel.bulletPrimario;
color = sslidemodel.colorPrimario;
                  }else{
tamano =sslidemodel.bulletSecundario;
color = sslidemodel.colorSecundario;
                  }
    return AnimatedContainer(
        //tarea

        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: tamano,
        width: tamano,
        decoration: BoxDecoration(
          color:color,
          shape: BoxShape.circle,
        ));
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key, required this.slides}) : super(key: key);
  final List<Widget> slides;
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
//en false por que esta en el initState
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
          controller: pageViewController,
          children: widget.slides
              .map((slide) => _Slide(
                    slide: slide,
                  ))
              .toList()),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.slide,
  }) : super(key: key);
  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

//para no depender de otra pagina
class _SliderModel extends ChangeNotifier {
  double _currentpage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double get currentPage => _currentpage;
  double _bulletPrimario = 12;
  // se puede quitar el set y get  y nada mas defnir la variable
  late double bulletSecundario;

  set currentPage(double pagina) {
    _currentpage = pagina;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;

  set colorPrimario(Color color) {
    _colorPrimario = color;
  }

  Color get colorSecundario => _colorSecundario;

  set colorSecundario(Color color) {
    _colorSecundario = color;
  }

  double get bulletPrimario => _bulletPrimario;

  set bulletPrimario(double valor) {
    _bulletPrimario = valor;
  }
}
