import 'package:designs/src/pages/animaciones_pages.dart';
// import 'package:designs/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnimacionesPage(),
    );
  }
}
