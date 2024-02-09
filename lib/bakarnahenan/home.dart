// import 'Item/Kalla.dart';
// import 'provider/item.dart';
// import 'package:flutter/material.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:provider/provider.dart';

// import 'merchant/screen1.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List screen = [
//     Kalla(),
//     Screen1(),
//   ];
//   List<Color> color = [
//     const Color(0xff03Ac13),
//     const Color(0xff980000),
//     const Color(0xffcc0000),
//     const Color(0xff741b47),
//     const Color(0xff1c4587),
//     const Color(0xffff9900),
//     const Color(0xff0c343d),
//     const Color.fromARGB(255, 54, 26, 54)
//   ];
//   List<IconData> icon = [
//     LineIcons.home,
//     LineIcons.fileInvoiceWithUsDollar,
//     LineIcons.store,
//     LineIcons.users,
//     LineIcons.thList,
//     LineIcons.barChart,
//     LineIcons.handHoldingUsDollar,
//     LineIcons.info
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Color(0xffEAEBEB),
//         appBar: AppBar(
//           title:
//               Text("GTC", style: TextStyle(fontSize: 25, color: Colors.white)),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(20), top: Radius.circular(0))),
//           centerTitle: true,
//           backgroundColor: Color(0xff674ea7),
//           elevation: 0,
//         ),
//         body: Consumer<Item>(builder: (context, value, child) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1.2,
//                 mainAxisExtent: 140,
//               ),
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: value.name1.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         value.Index(index);
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => screen[index],
//                         ));
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: color[index],
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Center(
//                           child: Column(
//                             children: [
//                               Spacer(),
//                               Icon(
//                                 icon[index],
//                                 color: Colors.white,
//                                 size: 45,
//                               ),
//                               Text(
//                                 value.name1[index],
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 22,
//                                 ),
//                               ),
//                               Spacer(),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ));
//               },
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
