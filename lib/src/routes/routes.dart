  // import 'package:designs/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';





// import 'package:designs/src/labs/slideshow_page.dart';
import 'package:designs/src/pages/emergecy_page.dart';
import 'package:designs/src/pages/grafias_ciculares.dart';
import 'package:designs/src/pages/headers_pages.dart';
import 'package:designs/src/pages/painterest_page.dart';
import 'package:designs/src/pages/sliver_list_page.dart';
import 'package:designs/src/retos/cuadrado_animado.dart';

import '../pages/slideshow_page.dart';

final pageRoutes = <_Routes>[
  _Routes(FontAwesomeIcons.sliders, 'SlidesShow', SildeShowPage()),
  _Routes(FontAwesomeIcons.truckMedical, 'Emergencia', EmergencypagePage()),
  _Routes(FontAwesomeIcons.heading, 'Encabezados', HeaderPage()),
  _Routes(FontAwesomeIcons.peopleCarryBox, 'Cuadro animado', CuadradoAnimado()),
  _Routes(
      FontAwesomeIcons.circleNotch, 'BarraProgreso', GraficasCicularesPage()),
  _Routes(FontAwesomeIcons.pinterest, 'pinterest', PrinterestPage()),
  _Routes(FontAwesomeIcons.mobile, 'Slivers', SliverPage()),

  
  
  
 


];

class _Routes {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Routes(this.icon, this.titulo, this.page);
}
