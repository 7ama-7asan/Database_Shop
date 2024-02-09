import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/Firebase/FirebaseServices.dart';
import 'package:database/pages/items.dart';
import 'package:database/pages/trader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');
    var _auth = FirebaseAuth.instance;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 111, 183, 242),
          title: InkWell(
              onTap: () {
                Firebase_Class().Logout();
              },
              child: Text(_auth.currentUser!.email.toString())),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                  child: Cards('home', Icons.home)),
              Cards('invoice', Icons.inventory_outlined),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Trader(),
                        ));
                  },
                  child: Cards('trader', Icons.person)),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Items(),
                        ));
                  },
                  child: Cards('items', Icons.card_giftcard)),
              Cards('raport', Icons.line_axis),
              Cards('help', Icons.help),
              Cards('setting', Icons.settings),
            ],
          ),
        ));
  }
}

Widget Cards(name, icons) {
  return Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 55,
        ),
        Center(
            child: Text(
          name,
          style: TextStyle(fontSize: 30),
        )),
      ],
    ),
  );
}
