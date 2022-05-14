import 'package:designs/src/routes/routes.dart';
import 'package:designs/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños de flutter'),
      ),
      body: _ListaOpciones(),
      drawer: _MenuPrincipal(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      separatorBuilder: (context, i) => Divider(color: appTheme.primaryColorLight),
      itemCount: pageRoutes.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: appTheme.colorScheme.secondary),
        title: Text(pageRoutes[index].titulo),
        trailing:  Icon(
          Icons.chevron_right,
          color:appTheme.primaryColorLight,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoutes[index].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                // padding: EdgeInsets.symmetric(20),
                width: double.infinity,
                height: 200,
                child:  CircleAvatar(
                  backgroundColor: appTheme.currentTheme.accentColor,
                  child: Text(
                    'JV',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _ListaOpciones()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: appTheme.currentTheme.colorScheme.secondary),
              title: Text('Dark MOde'),
              trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  activeColor: appTheme.currentTheme.colorScheme.secondary,
                  onChanged: (value) {
                    appTheme.darkTheme = value;
                  }
                  
                  ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: appTheme.currentTheme.colorScheme.secondary),
                title: Text('Custom theme'),
                trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    activeColor: appTheme.currentTheme.colorScheme.secondary,
                     onChanged: (value) {
                    appTheme.customTheme = value;
                  }
                    
                    
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
