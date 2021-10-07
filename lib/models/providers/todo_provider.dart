import 'package:flutter/material.dart';
import '../task.dart';

class TodoProvider with ChangeNotifier {
  bool isChecked = false;
  List<Task> itemList = [
    // Task(title: 'First'),
    // Task(title: 'second'),
    // Task(title: 'third'),
  ];

  void addToList (String title) {
    itemList.add(Task(title: title));
    notifyListeners();
  }

  void removeFromList (index) {
    itemList.remove(itemList[index]);
    notifyListeners();
  }

  void isCheck (bool value, index) {
    itemList[index].isCheck = value;
    notifyListeners();
  }


  int get getLength  => itemList.length;
}
