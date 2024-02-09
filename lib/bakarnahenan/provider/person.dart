// import 'package:flutter/material.dart';

// import 'data.dart';

// class Person extends ChangeNotifier {
//   int id = 100;
//   int index = 0;
//   List catagory1 = ["جۆری بازرگان", "کریار", "فرۆشیار"];
//   List<Data> name = [];
//   List<int> number = [];
//   void Id() {
//     id++;
//     notifyListeners();
//   }

//   void add(Data data1) {
//     name.add(data1);
//     notifyListeners();
//   }

//   void remove(Data data1) {
//     name.remove(data1);
//     notifyListeners();
//   }

//   void Index(int index) {
//     this.index = index;
//     notifyListeners();
//   }

//   void update(String nam, int id, String num2, int index) {
//     name[index] = Data(name: nam, id: id, num: num2);
//     notifyListeners();
//   }

//   String select = "جۆری بازرگان";
//   void sel(String send) {
//     select = send;
//     notifyListeners();
//   }
// }
