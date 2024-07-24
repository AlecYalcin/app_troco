import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ListMenuWidget extends HookWidget {
  const ListMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Card(
              shadowColor: Theme.of(context).primaryColor,
              child: const Column(children: [
                SizedBox(height: 10),
                Text("Menu 01"),
                SizedBox(height: 10)
              ]));
        },
        separatorBuilder: (context, index) => const SizedBox.shrink(),
        itemCount: 15);
  }
}
