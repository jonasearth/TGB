import 'package:flutter/material.dart';
import 'package:tgb/jogadores.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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

      home: MyHomePages(),

    );
  }


}
class MyHomePages extends StatefulWidget {

  @override
  MyHomePage createState() => MyHomePage();

}

class MyHomePage extends State<MyHomePages> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("meu app porra")),
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



  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");



      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");



      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }




}

