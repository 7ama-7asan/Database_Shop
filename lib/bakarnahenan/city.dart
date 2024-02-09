// import 'provider/item.dart';
// import 'provider/person.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // ignore: must_be_immutable
// class City extends StatelessWidget {
//   String help;
//   // ignore: non_constant_identifier_names
//   GlobalKey<FormState> globalkey;
//   List map;
//   String vali;
//   String value;
//   City(
//       {required this.globalkey,
//       required this.help,
//       required this.map,
//       required this.vali,
//       required this.value});
//   @override
//   Widget build(BuildContext context) {
//     return Consumer2<Item, Person>(
//       builder: (context, value, value1, child) {
//         return Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Form(
//             key: globalkey,
//             child: DropdownButtonFormField<String>(
//               dropdownColor: Colors.white,
//               value: this.value,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: Colors.white, width: 1)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: Colors.white, width: 1)),
//               ),
//               items: map
//                   .map((e) => DropdownMenuItem<String>(
//                         child: Text(e,
//                             style:
//                                 TextStyle(color: Colors.black, fontSize: 16)),
//                         value: e,
//                       ))
//                   .toList(),
//               onChanged: (val) {
//                 if (value.index1 == 0) {
//                   value.sel(val as String);
//                 } else if (value.index1 == 1) {
//                   value1.sel(val as String);
//                 }
//               },
//               validator: (val) {
//                 if (val == vali) {
//                   return help;
//                 } else
//                   return null;
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
