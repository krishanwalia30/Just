import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:just/screens/home_page.dart';

import 'package:just/canBeDeleted/profile_page.dart';

import '../utils/fire_auth.dart';
import '../utils/validator.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Register'),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(255, 87, 87, 1)),
                    height: MediaQuery.of(context).size.height / 2.7,
                    width: MediaQuery.of(context).size.width,
                    child:
                        Image.asset('assets/systemImages/registerPageIcon.png'),
                    // padding: ,
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
                              topRight: Radius.circular(50),
                            ),
                            color: Colors.white),
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 14,
                                right: MediaQuery.of(context).size.width / 2.3,
                              ),
                              child: const Text(
                                'sign up.',
                                style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(255, 87, 87, 1)),
                              ),
                            ),

                            /////// CODE FOR THE FORM,---
                            Form(
                              key: _registerFormKey,
                              child: Column(
                                children: <Widget>[
                                  // CODE FOR THE NAME LABEL
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          15,
                                      right: MediaQuery.of(context).size.width /
                                          1.4,
                                    ),
                                    child: const Text(
                                      'Name:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ),

                                  // CODE FOR THE NAME TEXT FORM FIELD
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          100,
                                      right: MediaQuery.of(context).size.width /
                                          11,
                                      left: MediaQuery.of(context).size.width /
                                          11,
                                    ),
                                    child: TextFormField(
                                      controller: _nameTextController,
                                      focusNode: _focusName,
                                      validator: (value) =>
                                          Validator.validateName(
                                        name: value,
                                      ),
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(125, 255, 87, 87),
                                      ),
                                    ),
                                  ),

                                  // CODE FOR THE EMAIL LABEL
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          30,
                                      right: MediaQuery.of(context).size.width /
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

                                  // CODE FOR THE EMAIL TEXT FORM FIELD
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          100,
                                      right: MediaQuery.of(context).size.width /
                                          11,
                                      left: MediaQuery.of(context).size.width /
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
                                                BorderRadius.circular(10)),
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(125, 255, 87, 87),
                                      ),
                                    ),
                                  ),

                                  // CODE FOR THE PASSWORD LABEL
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          30,
                                      right: MediaQuery.of(context).size.width /
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

                                  // CODE FOR THE PASSWORD TEXT FORM FIELD
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          100,
                                      right: MediaQuery.of(context).size.width /
                                          11,
                                      left: MediaQuery.of(context).size.width /
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
                                                BorderRadius.circular(10)),
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(125, 255, 87, 87),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 50),
                                    child: InkWell(
                                        onTap: () {
                                          // CODE TO PROCEED TO THE LOGIN PAGE
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => LoginPage(),
                                            ),
                                          );
                                        },
                                        child:
                                            Text('Already have an account ?')),
                                  ),

                                  // CODE TO SUBMIT THE FORM
                                  _isProcessing
                                      ? const CircularProgressIndicator(
                                          color: Color.fromRGBO(255, 87, 87, 1),
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          3.5,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          17),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 255, 87, 87),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 50, right: 50),
                                                ),
                                                onPressed: () async {
                                                  setState(() {
                                                    _isProcessing = true;
                                                  });

                                                  if (_registerFormKey
                                                      .currentState!
                                                      .validate()) {
                                                    User? user = await FireAuth
                                                        .registerUsingEmailPassword(
                                                      name: _nameTextController
                                                          .text,
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
                                                          .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomePage(
                                                                  user: user),
                                                        ),
                                                        ModalRoute.withName(
                                                            '/'),
                                                      );
                                                    }
                                                  }
                                                },
                                                child: Text(
                                                  'Sign up',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Text(
              //   'Register',
              //   style: Theme.of(context).textTheme.headline2,
              // ),
              // SizedBox(height: 20),
              Form(
                // key: _registerFormKey,
                child: Column(
                  children: <Widget>[
                    // TextFormField(
                    //   controller: _nameTextController,
                    //   focusNode: _focusName,
                    //   validator: (value) => Validator.validateName(
                    //     name: value,
                    //   ),
                    //   decoration: InputDecoration(
                    //     hintText: "Name",
                    //     errorBorder: UnderlineInputBorder(
                    //       borderRadius: BorderRadius.circular(6.0),
                    //       borderSide: BorderSide(
                    //         color: Colors.red,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 16.0),
                    // TextFormField(
                    //   controller: _emailTextController,
                    //   focusNode: _focusEmail,
                    //   validator: (value) => Validator.validateEmail(
                    //     email: value,
                    //   ),
                    //   decoration: InputDecoration(
                    //     hintText: "Email",
                    //     errorBorder: UnderlineInputBorder(
                    //       borderRadius: BorderRadius.circular(6.0),
                    //       borderSide: BorderSide(
                    //         color: Colors.red,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 16.0),
                    // TextFormField(
                    //   controller: _passwordTextController,
                    //   focusNode: _focusPassword,
                    //   obscureText: true,
                    //   validator: (value) => Validator.validatePassword(
                    //     password: value,
                    //   ),
                    //   decoration: InputDecoration(
                    //     hintText: "Password",
                    //     errorBorder: UnderlineInputBorder(
                    //       borderRadius: BorderRadius.circular(6.0),
                    //       borderSide: BorderSide(
                    //         color: Colors.red,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 32.0),
                    // _isProcessing
                    //     ? CircularProgressIndicator()
                    //     : Row(
                    //         children: [
                    //           Expanded(
                    //             child: ElevatedButton(
                    //               onPressed: () async {
                    //                 setState(() {
                    //                   _isProcessing = true;
                    //                 });

                    //                 if (_registerFormKey.currentState!
                    //                     .validate()) {
                    //                   User? user = await FireAuth
                    //                       .registerUsingEmailPassword(
                    //                     name: _nameTextController.text,
                    //                     email: _emailTextController.text,
                    //                     password: _passwordTextController.text,
                    //                   );

                    //                   setState(() {
                    //                     _isProcessing = false;
                    //                   });

                    //                   if (user != null) {
                    //                     Navigator.of(context)
                    //                         .pushAndRemoveUntil(
                    //                       MaterialPageRoute(
                    //                         builder: (context) =>
                    //                             HomePage(user: user),
                    //                       ),
                    //                       ModalRoute.withName('/'),
                    //                     );
                    //                   }
                    //                 }
                    //               },
                    //               child: Text(
                    //                 'Sign up',
                    //                 style: TextStyle(color: Colors.white),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
