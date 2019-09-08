import 'package:flutter/material.dart';
import 'package:tgb/jogadores.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'TGB';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: new ThemeData(

        brightness: Brightness.dark,
      ),

      home: MyHomePage(title: appTitle),

    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Se Fuder')),
      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black  ,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/img/tgb1.jpg',
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: Text('Agendar Baba'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_pin),
              title: Text('Jogadores'),

              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Jogadores()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: Text('Times'),
              onTap: () {
                Navigator.pop(context);
              },

            ),
          ],
        ),
      ),
    );
  }
}

