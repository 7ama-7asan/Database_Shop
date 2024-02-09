import 'package:database/Firebase/FirebaseServices.dart';

import 'package:database/pages/home.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _User = TextEditingController();
  var _Pass = TextEditingController();

  bool isClicked = false;

  // Function to show the loading dialog

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Executing Operation...'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _User.dispose();

    _Pass.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9E5DE),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(200, 20, 200, 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(20),
                color: Color.fromARGB(255, 114, 215, 243),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //     height: 200,
                    //     width: 100,
                    //     child: Image.asset('assets/logo2.jpg')),
                    //Icon Logo
                    // Image.asset('assets/logo.png'),
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/logoGTC.png'),
                      radius: 60.0,
                    ),

                    const SizedBox(
                      height: 5.0,
                    ),

                    //greeting text

                    Text(
                      "GTC",
                      style: GoogleFonts.secularOne(
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2F1500),
                      ),
                    ),

                    const SizedBox(
                      height: 5.0,
                    ),

                    const Text('Welcome back, you\'ve been missed.',
                        style: TextStyle(
                          fontSize: 16,
                        )),

                    const SizedBox(
                      height: 40.0,
                    ),

                    //email text field

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _User,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    //password text field

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _Pass,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),

                    //login button

                    const SizedBox(
                      height: 20.0,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (!isClicked) {
                              setState(() {
                                isClicked = true;
                              });
                            } else {
                              setState(() {
                                isClicked = false;
                              });
                            }
                            try {
                              Firebase_Class().SigninWithEmail(
                                  _User.text, _Pass.text, context);
                            } catch (e) {
                              // Find the Scaffold in the widget tree and show the Snackbar
                            }
                          },
                          child: Container(
                            width: 400,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF2F1500),
                            ),
                            child: Center(
                                child: isClicked == false
                                    ? Text(
                                        'Log in',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      )
                                    : CircularProgressIndicator()),
                          ),
                        ),
                      ),
                    ),

                    //not a member? register now

                    const SizedBox(
                      height: 20.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Not a member? ',
                          style: TextStyle(
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          'register now',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
