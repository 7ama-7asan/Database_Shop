// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import 'data.dart';

// class Item extends ChangeNotifier {
//   int index = 0;
//   get index1 => index;
//   int id = 100;
//   // ignore: non_constant_identifier_names
//   void Id() {
//     id++;
//     notifyListeners();
//   }

//   List<Data> data = [];
//   List<String> name = [
//     "سەرەکی",
//     "پسوڵە",
//     "کۆگا",
//     "بازرگان",
//     "کەرەستە",
//     "راپۆرت",
//     "باڵانس",
//     "دەربارەی ئێمە"
//   ];
//   List<String> get name1 => name;

//   List<String> catagory = ["جۆری کەرەستە", "Laptop", "Mobile", "Smart Watch"];

//   void add(Data data1) {
//     data.add(data1);
//     notifyListeners();
//   }

//   void remove(Data data1) {
//     data.remove(data1);
//     notifyListeners();
//   }

//   List<Data> get list => data;
//   String select = "جۆری کەرەستە";
//   void sel(String send) {
//     select = send;
//     notifyListeners();
//   }

//   // ignore: non_constant_identifier_names
//   void Index(int index) {
//     this.index = index;
//     notifyListeners();
//   }

//   void update(String name, int id, String num1, int index) {
//     data[index] = Data(name: name, id: id, num: num1);
//     notifyListeners();
//   }
// }
