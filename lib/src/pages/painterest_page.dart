import 'package:designs/src/widgets/printerest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PrinterestPage extends StatelessWidget {
  const PrinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: const [
            PinterestGrid(),
            _MenuLocation(),
          ],
        ),

        // body: PrinterestMenu(),
      ),
    );
  }
}

class _MenuLocation extends StatelessWidget {
  const _MenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;
    final mostar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
        bottom: 30,
        child: Container(
            width: widthPantalla,
            child: Align(
                child: PrinterestMenu(
              // activeColor: Colors.pink,
              // inactiveColor: Colors.blueAccent,
              // backgroundColor: Colors.pinkAccent,
              mostar: mostar,
              items: [
                PrinterestButto(
                    icon: Icons.pie_chart,
                    onPressed: () {
                      print('pie_chart');
                    }),
                PrinterestButto(
                    icon: Icons.search,
                    onPressed: () {
                      print('search');
                    }),
                PrinterestButto(
                    icon: Icons.notifications,
                    onPressed: () {
                      print('notifications');
                    }),
                PrinterestButto(
                    icon: Icons.supervised_user_circle,
                    onPressed: () {
                      print('supervised_user_circle');
                    }),
              ],
            ))));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  ScrollController controller = ScrollController();
  final List<int> items = List.generate(200, (index) => index);
  double scrollAnterior = 0;
  @override
  void initState() {
    controller.addListener(() {
      print('ScrollListener ${controller.offset}');

      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;

        print('ocultar menu');
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;

        print('MOstar mnenu');
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        pattern: [
          const WovenGridTile(1),
          const WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _PinterestItem(index: index),
          childCount: items.length),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool value) {
    _mostrar = value;
    notifyListeners();
  }
}
