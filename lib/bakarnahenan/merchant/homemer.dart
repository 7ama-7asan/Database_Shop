// import '../provider/person.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../Item/bodytwo.dart';
// import '../provider/item.dart';

// class Merchant extends StatefulWidget {
//   @override
//   State<Merchant> createState() => _MerchantState();
// }

// class _MerchantState extends State<Merchant> {
//   TextEditingController _controller = TextEditingController();
//   TextEditingController _controller2 = TextEditingController();
//   TextEditingController _controller3 = TextEditingController();
//   final _globalkey = GlobalKey<FormState>();
//   final _globalkey1 = GlobalKey<FormState>();
//   final _globalkey2 = GlobalKey<FormState>();
//   final _globalkey3 = GlobalKey<FormState>();
//   String help = "تکایە ناوی کەرەستەکە بنوسە";
//   String help2 = "بارکۆد بنوسە";
//   String help3 = " جۆری بازرگان دیاری بکە";
//   String help4 = "ژمارەی موبایل بنوسە";

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _controller.dispose();
//     _controller2.dispose();
//     _controller3.dispose();
//   }

//   void initState() {
//     super.initState();
//     // TODO: implement initState

//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       var auth = Provider.of<Person>(context, listen: false);
//       _controller2.value =
//           _controller2.value.copyWith(text: auth.id.toString());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var auth = Provider.of<Person>(context, listen: false);
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//           backgroundColor: Color(0xffEAEBEB),
//           resizeToAvoidBottomInset: false,
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
//           body: Selector<Person, List>(
//               selector: (p0, p1) => p1.catagory1,
//               builder: (context, value, child) {
//                 return Center(
//                   child: Column(
//                     children: [
//                       Bodytwo(
//                         value: auth.select,
//                         vali: auth.catagory1[0],
//                         cata: value,
//                         g1: _globalkey,
//                         g2: _globalkey1,
//                         g3: _globalkey2,
//                         controller: _controller,
//                         controller2: _controller2,
//                         help: help,
//                         help2: help2,
//                         help3: help3,
//                         controller3: _controller3,
//                         g4: _globalkey3,
//                         label: "ژمارەی موبایل",
//                         help4: help4,
//                       ),
//                     ],
//                   ),
//                 );
//               })),
//     );
//   }
// }
