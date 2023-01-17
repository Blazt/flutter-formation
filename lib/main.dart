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
  String sentence = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          const SizedBox(height: 10),
          TextFormField(
            initialValue: "initial value",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    _getDialog(context),
                  );
                } else {
                  print("passe pas");
                }
              },
              child: const Text("valider"))
        ]));
  }

  SnackBar _getDialog(BuildContext context) {
    return SnackBar(
        content: const Text('Processing Data'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: const Text("Warning !"),
                        content: ElevatedButton(
                          child: const Text("Valider !"),
                          onPressed: () {
                            Navigator.of(context).pop("grgr");
                          },
                        ));
                  });
              print("test");
            }));
  }
}
