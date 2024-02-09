import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';

class Firebase_Class {
  var _auth = FirebaseAuth.instance;

  ///////// Logout

  Future Logout() async {
    await _auth.signOut();
  }

////////////// Sign In

  Future SigninWithEmail(String Email, String pass, context) async {
    try {
      UserCredential rs = await _auth.signInWithEmailAndPassword(
        email: Email,
        password: pass,
      );

      return rs.user;
    } catch (_error) {
      error(context, _error.toString());
    }
  }

  Future getFuture() {
    return Future(() async {
      await Future.delayed(Duration(seconds: 5));

      return 'بەسەرکەوتووی داخل بوویت ، کلیک لەسەر چوونەژوورە بکە';
    });
  }

  Future<void> showProgressWithCustomProgress(
      BuildContext context, Future<void> Function() function) async {
    var result = await showDialog(
      context: context,
      builder: (context) => FutureProgressDialog(
        function(),
        progress: CircularProgressIndicator(),
        message: Text('چاوەروان بە ......'),
      ),
    );

    showResultDialog(context, result);
  }

  void showResultDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(result),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text('چوونە ژوورەوە'),
            ),
          ),
        ],
      ),
    );
  }

  void showErrorDialog(BuildContext context, String error) {
    var x;

    // Your error handling logic here...

    // ...

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('هەڵە روویدا '),
        content: Text(x.toString()),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }

//   Future<void> showProgressWithCustomProgress(BuildContext context) async {

//     var result = await showDialog(

//         context: context,

//         builder: (context) => FutureProgressDialog(

//               getFuture(),

//               progress: CircularProgressIndicator(),

//               message: Text('چاوەروان بە ......'),

//             ));

//     showDialog(

//       context: context,

//       builder: (context) => AlertDialog(

//         content: Text(result),

//         actions: <Widget>[

//           TextButton(

//             onPressed: () {

//               Navigator.of(context).pop();

//             },

//             child: ElevatedButton(

//                 onPressed: () {

//                   Navigator.of(context).pop();

//                   Navigator.push(

//                       context, MaterialPageRoute(builder: (context) => Home()));

//                 },

//                 child: Text('چوونە ژوورەوە')),

//           )

//         ],

//       ),

//     );

//   }

  error(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          var x;

          if (e ==
              '[firebase_auth/invalid-email] The email address is badly formatted.') {
            x = 'شێوازی ئیمێڵت هەلەیە دەبێت بەم شێوەیە بێت example@dwarozh.com';
          } else if (e ==
              '[firebase_auth/weak-password] Password should be at least 6 characters') {
            x = 'وشەی نهێنیت لاوازە نابێ لە 6 character کەمتربێ';
          } else if (e ==
              '[firebase_auth/channel-error] Unable to establish connection on channel.') {
            x = ' پێویستە ئیمەیڵ و وشەی نهێنی داخل بکەی';
          } else if (e ==
              '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
            x = 'ئەم ئیمەیلە درووستکراوە پێشتر ، تکایە ئیمێڵێکی تر بەکاربهێنە';
          } else if (e ==
              '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
            x = 'ئەم ئیمەیلە درووست نەکراوە ';
          } else if (e ==
              '[firebase_auth/unknown] Given String is empty or null') {
            x = 'پێویستە ئیمێڵ و وشەی نهێنی بنووسی ، نابێ بەتاڵ بێت';
          } else if (e ==
              '[firebase_auth/user-disabled] The user account has been disabled by an administrator.') {
            x = 'ئەم ئیمەیلە لەلایەن ئەدمینەوە بلۆک کراوە';
          } else if (e ==
              '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
            x = 'وشەی نهێنی ئەم ئیمەیڵە هەڵەیە ';
          } else {
            x = e;
          }

          return AlertDialog(
            title: Text('هەڵە روویدا '),
            content: Text(x.toString()),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('ok'),
              )
            ],
          );
        });
  }
}


//!
