import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class inser_data_to_merchant_Firebase {
  var firefirestore = FirebaseFirestore.instance;
  var _user = FirebaseAuth.instance.currentUser;
  Future<void> insertMerchant(String name, String type, String brand,
      String priceSell, String priceBuy) async {
    await firefirestore
        .collection('users')
        .doc(_user!.email.toString())
        .collection('merchant')
        .add({
      'name': name,
      'type': type,
      'brand': brand,
      'price_sell': priceSell,
      'price_buy': priceBuy,
    });
  }
}
