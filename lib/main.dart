import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/providers/todo_provider.dart';
import 'views/add_screen.dart';
import 'views/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          AddScreen.routeName: (context) => AddScreen()
        },
      ),
    );
  }
}
