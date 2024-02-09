// import 'homemer.dart';
// import '../provider/item.dart';
// import '../provider/person.dart';
// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// import '../Textfield.dart';

// class Screen1 extends StatefulWidget {
//   @override
//   State<Screen1> createState() => _KallaState();
// }

// class _KallaState extends State<Screen1> {
//   final controller1 = TextEditingController();
//   final controller2 = TextEditingController();
//   final controller3 = TextEditingController();
//   final _globalkey = GlobalKey<FormState>();
//   final _globalkey1 = GlobalKey<FormState>();
//   final _globalkey2 = GlobalKey<FormState>();
//   String help = "تکایە ناوی بازرگان بنوسە";
//   String help2 = "بارکۆد بنوسە";
//   String help4 = "ژمارەی موبایل بنوسە";
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     controller1.dispose();
//     controller2.dispose();
//     controller3.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var auth = Provider.of<Person>(context, listen: false);
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.miniEndFloat,
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               auth.select = auth.catagory1[0];
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => Merchant(),
//               ));
//             },
//             child: Icon(
//               Icons.add,
//               size: 30,
//             ),
//           ),
//           backgroundColor: Color(0xffEAEBEB),
//           appBar: AppBar(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.vertical(
//                     bottom: Radius.circular(20), top: Radius.circular(0))),
//             title: Selector<Item, String>(
//                 selector: (contex, p1) => p1.name1[p1.index1],
//                 builder: (context, p1, child) {
//                   return Text(p1,
//                       style: TextStyle(fontSize: 25, color: Colors.white));
//                 }),
//             centerTitle: true,
//             backgroundColor: Color(0xff674ea7),
//             elevation: 0,
//           ),
//           body: Column(
//             children: [
//               Padding(padding: EdgeInsets.all(15)),
//               Expanded(
//                 child: Consumer<Person>(
//                   builder: (context, value, child) {
//                     return ListView.separated(
//                       reverse: false,
//                       physics: AlwaysScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: value.name.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           child: ListTile(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20)),
//                             tileColor: Colors.white,
//                             title: Text(
//                               value.name[index].name,
//                               style: TextStyle(
//                                 fontSize: 20,
//                               ),
//                             ),
//                             subtitle: Padding(
//                               padding: const EdgeInsets.only(top: 8),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(" ${value.name[index].id}",
//                                       style: TextStyle(color: Colors.green)),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 4),
//                                     child: Text(
//                                       " ${value.select}",
//                                       style: TextStyle(color: Colors.green),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             trailing: IconButton(
//                                 onPressed: () {
//                                   value.remove(value.name[index]);
//                                 },
//                                 icon: Icon(
//                                   Icons.delete,
//                                   size: 24,
//                                   color: Colors.red,
//                                 )),
//                             leading: IconButton(
//                               icon: Icon(
//                                 Icons.edit,
//                                 size: 24,
//                                 color: Colors.green,
//                               ),
//                               onPressed: () async {
//                                 controller1.text = value.name[index].name;
//                                 controller2.text =
//                                     value.name[index].id.toString();
//                                 controller3.text = value.name[index].num;
//                                 showDialog(
//                                   context: context,
//                                   builder: (context) => Directionality(
//                                     textDirection: TextDirection.rtl,
//                                     child: AlertDialog(
//                                         backgroundColor: Color(0xffEAEBEB),
//                                         content: SingleChildScrollView(
//                                           keyboardDismissBehavior:
//                                               ScrollViewKeyboardDismissBehavior
//                                                   .onDrag,
//                                           child: ListBody(
//                                             children: [
//                                               Text(
//                                                 "بۆ گۆرینی زانیارییەکان کلیک لە جێبەجێکردن بکە",
//                                                 style: TextStyle(fontSize: 20),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     top: 20),
//                                                 child: Textfiled(
//                                                   help: help,
//                                                   globalkey: _globalkey,
//                                                   controller: controller1,
//                                                   label: "ناوی بازرگان",
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     top: 20, bottom: 10),
//                                                 child: Textfiled(
//                                                     help: help2,
//                                                     globalkey: _globalkey1,
//                                                     controller: controller2,
//                                                     label: "بارکۆد"),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     top: 20, bottom: 10),
//                                                 child: Textfiled(
//                                                     help: help4,
//                                                     globalkey: _globalkey2,
//                                                     controller: controller3,
//                                                     label: "ژمارە موبایل"),
//                                               )
//                                             ],
//                                           ),
//                                           physics: BouncingScrollPhysics(),
//                                         ),
//                                         actions: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                               bottom: 20,
//                                             ),
//                                             child: TextButton(
//                                                 style: TextButton.styleFrom(
//                                                   shape: RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20),
//                                                       side: BorderSide(
//                                                           width: 2,
//                                                           color: Color(
//                                                               0xff03Ac13))),
//                                                 ),
//                                                 onPressed: () {
//                                                   Navigator.of(context).pop();
//                                                 },
//                                                 child: Text(
//                                                   "گەرانەوە",
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 20),
//                                                 )),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 bottom: 20,
//                                                 right: 20,
//                                                 left: 40),
//                                             child: TextButton(
//                                                 style: TextButton.styleFrom(
//                                                     shape:
//                                                         RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         20)),
//                                                     side: BorderSide(
//                                                         width: 2,
//                                                         color:
//                                                             Color(0xff03Ac13))),
//                                                 onPressed: () {
//                                                   final va1 = _globalkey
//                                                       .currentState!
//                                                       .validate();
//                                                   final va2 = _globalkey1
//                                                       .currentState!
//                                                       .validate();
//                                                   final va3 = _globalkey2
//                                                       .currentState!
//                                                       .validate();

//                                                   if (va1 == true &&
//                                                       va2 == true &&
//                                                       va3 == true) {
//                                                     value.update(
//                                                         controller1.text,
//                                                         int.parse(
//                                                             controller2.text),
//                                                         controller3.text,
//                                                         index);
//                                                     Navigator.of(context).pop();
//                                                   } else
//                                                     return;
//                                                 },
//                                                 child: Text(
//                                                   "جێبەجێکردن",
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 20),
//                                                 )),
//                                           ),
//                                         ]),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                       separatorBuilder: (context, index) {
//                         return Divider(
//                           thickness: 1,
//                           height: 1,
//                           color: Color(0xffEAEBEB),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
