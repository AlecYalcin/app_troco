import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../data/menu/ui/list.dart';
import '../data/table/ui/list.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.title,
      ),
      body: MyBody(currentIndex: _currentIndex),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
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

class MyBody extends StatelessWidget {
  final int currentIndex;
  const MyBody({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final pages = [const ListTableWidget(), const ListMenuWidget()];

    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: pages[currentIndex]);
  }
}

class MyBottomNavigationBar extends HookWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const MyBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTabSelected,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(label: 'Mesas', icon: Icon(Icons.restaurant)),
          BottomNavigationBarItem(label: 'Menus', icon: Icon(Icons.menu_book))
        ]);
  }
}
