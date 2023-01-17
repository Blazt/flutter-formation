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
    return Column(children: [
      FutureBuilder(
          future: getText(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Text(snapshot.connectionState.toString());
          }),
      StreamBuilder(
          stream: getNumbers(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text(
                "${snapshot.connectionState} ${snapshot.error} ${snapshot.data}");
          })
    ]);
  }

  Future<String> getText() async {
    await Future.delayed(const Duration(seconds: 5));
    return "Mon contenu";
  }

  Stream<int> getNumbers() async* {
    for (int i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
    throw Exception("test");
  }
}
