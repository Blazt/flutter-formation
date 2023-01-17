import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        /*theme: ThemeData.light().copyWith(
            primaryIconTheme: IconThemeData(
                color: Colors.black54
            )
        )*/
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Content(),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Drawer Header',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Messages'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Profile'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black54),
                title: const Text("Tableau de bord",
                    style: TextStyle(color: Colors.black54)),
                backgroundColor: Colors.white,
                actions: const [
                  AppBarIcon(icon: Icons.calendar_month),
                  AppBarIcon(icon: Icons.mail),
                  AppBarIcon(icon: Icons.star),
                ])));
  }
}

class AppBarIcon extends StatelessWidget {
  final IconData icon;

  const AppBarIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Icon(icon, color: Colors.black54));
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          width: size.width * 0.75,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.yellow, width: 10)),
          child: const Text(
              "testreferfer rfefef erfe fer fer fer fer ferfrf erferferf rrefer")),
      Positioned(
          bottom: -10,
          right: -10,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          )),
    ]);
  }
}
