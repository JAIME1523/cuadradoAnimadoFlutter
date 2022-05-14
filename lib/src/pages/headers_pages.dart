import 'package:designs/src/pages/animaciones_pages.dart';
import 'package:designs/src/theme/theme.dart';
import 'package:designs/src/widgets/headers.dart';
// import 'package:designs/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accetcolor = Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary;
    return  Scaffold(
      body: HeaderWave(color: accetcolor,),
    );
  }
}
