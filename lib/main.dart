// import 'package:designs/labs/circular_progres_page.dart';
// import 'package:designs/pages/grafias_ciculares.dart';
// import 'package:designs/src/labs/slideshow_page.dart';
// import 'package:designs/src/pages/emergecy_page.dart';
import 'package:designs/src/pages/slider_list_page.dart';
// import 'package:designs/src/pages/painterest_page.dart';
import 'package:flutter/material.dart';

// import 'src/pages/slideshow_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SliderPage(),
    );
  }
}
