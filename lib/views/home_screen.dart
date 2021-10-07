import 'package:flutter/material.dart';
import 'package:testapp/views/all_item_screen.dart';
import 'package:testapp/views/incomplete_item_screen.dart';

import 'add_screen.dart';
import 'complete_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Todos'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Incomplete',
              ),
              Tab(
                text: 'Complete',
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AddScreen.routeName),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(15.0),
          child: TabBarView(
            children: [
              AllItemScreen(),
              IncompleteItemScreen(),
              CompleteItemScreen()
            ],
          ),
        ),
      ),
    );
  }
}
