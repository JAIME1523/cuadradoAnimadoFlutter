import 'package:designs/src/theme/theme.dart';
import 'package:designs/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SildeShowPage extends StatelessWidget {
  const SildeShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.purple,
        body: Column(children: const [
      Expanded(child: _MiSlideshow()),
      Expanded(child: _MiSlideshow()),
    ]));
  }
}

class _MiSlideshow extends StatelessWidget {
  const _MiSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return SlideShow(
      // puntosArriba: true,
      bulletPrimario: 15,
      colorPrimario: appTheme == ThemeData.dark()
          ? appTheme.colorScheme.secondary
          : Colors.pink,

      colorSecundario: Colors.grey,
      slides: <Widget>[
        SvgPicture.asset('assets/slide-1.svg'),
        SvgPicture.asset('assets/slide-2.svg'),
        SvgPicture.asset('assets/slide-3.svg'),
        SvgPicture.asset('assets/slide-4.svg'),
        SvgPicture.asset('assets/slide-5.svg'),
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        )
      ],
    );
  }
}
