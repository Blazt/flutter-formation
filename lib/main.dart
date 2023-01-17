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
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        print(settings.name);
        return MaterialPageRoute(builder: (BuildContext context) {
          return _getRoutes()[settings.name]!;
        });
      },
    );
  }

  Map<String, Widget> _getRoutes() {
    return <String, Widget>{
      "/": FirstScreen(navigatorKey: _navigatorKey),
      "/second": SecondScreen(navigatorKey: _navigatorKey),
    };
  }
}

class FirstScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const FirstScreen({required this.navigatorKey, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          final result =
              await navigatorKey.currentState!.pushNamed("/second") as int;
          print(result);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: Text("test"));
  }
}

class SecondScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const SecondScreen({required this.navigatorKey, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          navigatorKey.currentState!.pop(123);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        child: Text("test"));
  }
}
