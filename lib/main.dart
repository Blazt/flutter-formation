import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(),
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
  final _scrollController = ScrollController();
  final _containerKey = GlobalKey();

  Content({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(children: [
              Container(
                height: size.height / 2,
                color: Colors.blue,
              ),
              Container(
                key: _containerKey,
                height: size.height / 2,
                color: Colors.red,
              ),
              GestureDetector(
                  onTap: () {
                    RenderBox box = _containerKey.currentContext!
                        .findRenderObject() as RenderBox;
                    Offset position = box.localToGlobal(Offset.zero);
                    double y = position.dy;
                    print(y);
                  },
                  child: Container(
                    height: size.height / 2,
                    color: Colors.yellow,
                  ))
            ])));
  }
}
