import 'package:designs/src/models/layout_model.dart';
import 'package:designs/src/pages/launcher_tablet_page.dart';
import 'package:designs/src/theme/theme.dart';
import 'package:flutter/material.dart';

// import 'package:designs/labs/circular_progres_page.dart';
// import 'package:designs/pages/grafias_ciculares.dart';
// import 'package:designs/src/labs/slideshow_page.dart';
// import 'package:designs/src/pages/emergecy_page.dart';
import 'package:designs/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';
// import 'package:designs/src/pages/slider_list_page.dart';
// import 'package:designs/src/pages/painterest_page.dart';

// import 'src/pages/slideshow_page.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeChanger(2)),
      ChangeNotifierProvider(create: (_) => LayoutModel()),
    ], child: const MyApp()));

// void main() => runApp(ChangeNotifierProvider(
//     create: ((context) => ThemeChanger(2)), child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        final srcreenSized = MediaQuery.of(context).size;

        if (srcreenSized.width > 500) {
          return const LauncherPageTableta();
        } else {
          return const LauncherPage();
        }

        // print(orientation);
        //           return Container(
        //             child: LauncherPage(),
        //           );
        //         },
      }),
    );
  }
}
