import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'menu/ui/list.dart';
import 'table/ui/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App do Troco',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App do Troco!'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
      ),
      body: const MyBody(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    //backgroundColor: Theme.of(context).colorScheme.inversePrimary
    return AppBar(
        leading: const Padding(
            padding: EdgeInsets.all(8.0), child: Icon(Icons.reorder)),
        backgroundColor: Colors.blue,
        title: Text(title));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return ListTableWidget();
  }
}

class MyBottomNavigationBar extends HookWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(label: 'Mesas', icon: Icon(Icons.restaurant)),
      BottomNavigationBarItem(label: 'Menus', icon: Icon(Icons.menu_book))
    ]);
  }
}
