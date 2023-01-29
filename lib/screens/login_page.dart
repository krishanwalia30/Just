import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just/canBeDeleted/final.dart';

// import 'package:just/screens/profile_page.dart';
// import 'package:just/screens/profile_page.dart';

import 'package:just/screens/register_page.dart';

import '../utils/fire_auth.dart';
import '../utils/validator.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 30, bottom: 0),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 87, 87, 1)),
                          height: MediaQuery.of(context).size.height / 2.7,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            'assets/systemImages/loginPageIcon.png',
                            alignment: Alignment.bottomCenter,
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 4,
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50)),
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                              height: MediaQuery.of(context).size.height / 1.3,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          14,
                                      right: MediaQuery.of(context).size.width /
                                          2.3,
                                      // left: MediaQuery.of(context).size.width /
                                      //     2
                                    ),
                                    child: const Text(
                                      'sign in.',
                                      style: TextStyle(
                                          fontSize: 48,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromRGBO(255, 87, 87, 1)),
                                    ),
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                12,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.4,
                                          ),
                                          child: const Text(
                                            'Email:',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                11,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                11,
                                          ),
                                          child: TextFormField(
                                            controller: _emailTextController,
                                            focusNode: _focusEmail,
                                            validator: (value) =>
                                                Validator.validateEmail(
                                              email: value,
                                            ),
                                            decoration: InputDecoration(
                                              border: UnderlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              filled: true,
                                              fillColor: Color.fromARGB(
                                                  125, 255, 87, 87),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.6,
                                          ),
                                          child: const Text(
                                            'Password:',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                11,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                11,
                                          ),
                                          child: TextFormField(
                                            controller: _passwordTextController,
                                            focusNode: _focusPassword,
                                            obscureText: true,
                                            validator: (value) =>
                                                Validator.validatePassword(
                                              password: value,
                                            ),
                                            decoration: InputDecoration(
                                              border: UnderlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              filled: true,
                                              fillColor: Color.fromARGB(
                                                  125, 255, 87, 87),
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 90),
                                          child: InkWell(
                                              onTap: () {
                                                // CODE TO PROCEED TO THE REGISTER PAGE
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                  "Don't have an account ?")),
                                        ),

                                        // CODE FOR PROCESSING THE LOGIN ACTION
                                        _isProcessing
                                            ? const CircularProgressIndicator(
                                                color: Color.fromRGBO(
                                                    255, 87, 87, 1),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 13.0),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    fixedSize: Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            3.5,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            17),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 255, 87, 87),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 50,
                                                            right: 50),
                                                  ),
                                                  child: const Text(
                                                    'Done',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                  onPressed: () async {
                                                    print(
                                                        'Done Button Pressed');
                                                    _focusEmail.unfocus();
                                                    _focusPassword.unfocus();

                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      setState(() {
                                                        _isProcessing = true;
                                                      });

                                                      User? user = await FireAuth
                                                          .signInUsingEmailPassword(
                                                        email:
                                                            _emailTextController
                                                                .text,
                                                        password:
                                                            _passwordTextController
                                                                .text,
                                                      );

                                                      setState(() {
                                                        _isProcessing = false;
                                                      });

                                                      if (user != null) {
                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomePage(
                                                                    user:
                                                                        user), ////////////////////////////////////////////////
                                                          ),
                                                        );
                                                      }
                                                    }
                                                  },
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
