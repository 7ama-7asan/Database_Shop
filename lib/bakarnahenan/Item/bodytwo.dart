// import '../provider/person.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../Textfield.dart';
// import '../city.dart';
// import '../provider/data.dart';
// import '../provider/item.dart';

// // ignore: must_be_immutable
// class Bodytwo extends StatelessWidget {
//   // ignore: non_constant_identifier_names
//   GlobalKey<FormState> g1;
//   GlobalKey<FormState> g2;
//   GlobalKey<FormState> g3;
//   GlobalKey<FormState> g4;
//   TextEditingController controller;
//   TextEditingController controller2;
//   TextEditingController controller3;
//   String help;
//   String help2;
//   String help3;
//   String help4;
//   String label;
//   List cata;
//   String vali;
//   String value;

//   Bodytwo(
//       {super.key,
//       required this.g1,
//       required this.g2,
//       required this.g3,
//       required this.controller,
//       required this.controller2,
//       required this.help,
//       required this.help2,
//       required this.help3,
//       required this.controller3,
//       required this.g4,
//       required this.help4,
//       required this.cata,
//       required this.vali,
//       required this.value,
//       required this.label});
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 10),
//             child: Textfiled(
//                 controller: controller,
//                 globalkey: g1,
//                 help: help,
//                 label: "ناو"),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
//             child: Textfiled(
//                 controller: controller2,
//                 globalkey: g2,
//                 help: help2,
//                 label: "بارکۆد"),
//           ),
//           Padding(
//             padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
//             child: Textfiled(
//                 controller: controller3,
//                 label: label,
//                 globalkey: g4,
//                 help: help4),
//           ),
//           City(
//             value: this.value,
//             vali: vali,
//             globalkey: g3,
//             help: help3,
//             map: cata,
//           ),
//           Consumer2<Item, Person>(
//             builder: (contex, value, value1, child) {
//               return Padding(
//                 padding: const EdgeInsets.only(top: 20, bottom: 30),
//                 child: MaterialButton(
//                   onPressed: () {
//                     final va1 = g1.currentState!.validate();
//                     final va2 = g2.currentState!.validate();
//                     final va3 = g3.currentState?.validate();
//                     final va4 = g4.currentState!.validate();

//                     if (va1 == true &&
//                         va2 == true &&
//                         va3 == true &&
//                         va4 == true) {
//                       if (value.index == 0) {
//                         value.Id();

//                         value.add(Data(
//                             name: controller.text,
//                             id: int.parse(controller2.text),
//                             num: controller3.text));

//                         Navigator.of(context).pop();
//                         controller.clear();
//                         controller2.clear();
//                       } else if (value.index == 1) {
//                         value1.Id();

//                         value1.add(Data(
//                             name: controller.text,
//                             id: int.parse(controller2.text),
//                             num: controller3.text));

//                         Navigator.of(context).pop();
//                         controller.clear();
//                         controller2.clear();
//                       }
//                     } else
//                       return;
//                   },
//                   child: Text(
//                     "خەزنکردن",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   color: Color(0xff03Ac13),
//                   minWidth: 170,
//                   height: 40,
//                   splashColor: Colors.greenAccent,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       side: BorderSide(width: 1, color: Colors.grey)),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
