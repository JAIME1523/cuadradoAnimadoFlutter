// ignore_for_file: unused_element

import 'package:designs/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: const [
      _MainScroll(),
      Positioned(bottom: -10, right: 0, child: _BotonNewList())
    ]));
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    return ButtonTheme(
        minWidth: size.width * 0.9,
        height: 100,
        child: RaisedButton(
            color: appTheme.darkTheme
                ? appTheme.currentTheme.colorScheme.secondary
                : const Color(0xffED6762),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
            onPressed: () {},
            child: Text(
              'CREATE NEW LIST ',
              style: TextStyle(
                  color: appTheme.currentTheme.scaffoldBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3),
            )));
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    //CustomScrollView recibe slivers
    final items = [
      const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
      const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
      const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
      const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
      const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
      const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
      const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
      const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    ];
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // const SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('data'),
        // ),

        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              maxheigth: 200.0,
              minheight: 170.0,
              child: Container(
                color: appTheme.currentTheme.scaffoldBackgroundColor,
                alignment: Alignment.centerLeft,
                child: _Titulo(),
              ),
            )),

        SliverList(
            delegate: SliverChildListDelegate(
                [...items, const SizedBox(height: 100)]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheigth;
  final Widget child;
  _SliverCustomHeaderDelegate(
      {required this.minheight, required this.maxheigth, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // double get maxExtent => (minheight > maxheigth) ? minheight : maxheigth;
  double get maxExtent => maxheigth;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheigth != oldDelegate.maxExtent ||
        minheight != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  // _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'New ',
            style: TextStyle(
                color: appTheme.darkTheme ? Colors.grey : Color(0xff532128),
                fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                  width: 150,
                  height: 8,
                  color: appTheme.darkTheme
                      ? Colors.grey
                      : const Color(0xffE7CDD5)),
            ),
            const Text('List',
                style: TextStyle(
                    color: Color(0xffD93A30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  _ListaTareas({
    Key? key,
  }) : super(key: key);
  final items = [
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  
  final String titulo;
  final Color? color;

  const _ListItem({Key? key, this.titulo = '', this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(30),
        child: Text(titulo,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        height: 130,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: appTheme.darkTheme ?Colors.grey: color, 
            
            
            borderRadius: BorderRadius.circular(30)));
  }
}
