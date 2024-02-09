import 'package:database/pages/Login.dart';
import 'package:database/pages/home.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IsLogin extends StatelessWidget {
  const IsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Home();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return LoginPage();
      },
    );
  }
}
