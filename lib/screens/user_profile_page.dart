import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/cloud_storage.dart';

class UserProfilePage extends StatefulWidget {
  final User user;

  const UserProfilePage({required this.user});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  var imagePicker;
  var imageUrl;
  var _image;
  late XFile image;
  bool userSelectedImageForProfile = false;

  late User _currentUser;
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _userAgeController = TextEditingController();
  final TextEditingController _userLocationController = TextEditingController();

  @override
  void initState() {
    imagePicker = new ImagePicker();
    _currentUser = widget.user;
    _image = CloudFirestore.retrieveProfileImageUrl(_currentUser);

    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _userAgeController.dispose();

    super.dispose();
  }

  var _userGenderOption = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Center(
                      child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () async {
                            var source = ImageSource.gallery;
                            image = await imagePicker.pickImage(
                              source: source,
                              imageQuality: 50,
                            );
                            // uploadProfileImage(image,_currentUser);
                            setState(() {
                              _image = File(image.path);
                              userSelectedImageForProfile = true;

                              print('done done done done done done');
                              imageUrl = CloudFirestore.uploadProfileImage(
                                  image, _currentUser);
                            });
                          },
                          child: (userSelectedImageForProfile)
                              ? Container(
                                  margin: EdgeInsets.only(top: 100),
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(150),
                                      color: Colors.white),
                                  child: Image.file(
                                    _image,
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.only(top: 100),
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(150),
                                      color: Colors.white),
                                  child: Image.asset(
                                      'assets/systemImages/profileIcon.png'),
                                ),
                        ),
                      ),
                    ],
                  )),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Username: ',
                        hintText: "${_currentUser.displayName}",
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: _userAgeController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Age: ',
                        hintText: " ",
                        filled: true,
                      ),
                    ),
                  ),
                  DropdownButton(
                    itemHeight: 50,
                    focusColor: Colors.amber,
                    items: const [
                      DropdownMenuItem(
                        child: Text('Male'),
                        value: 'Male',
                      ),
                      DropdownMenuItem(
                        child: Text('Female'),
                        value: 'Female',
                      ),
                    ],
                    value: _userGenderOption,
                    onChanged: (String? value) {
                      setState(() {
                        _userGenderOption = value!;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: _userLocationController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Location: ',
                        hintText: "${_currentUser.displayName}",
                        filled: true,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        String message;
                        try {
                          final collection = FirebaseFirestore.instance
                              .collection('userProfileData')
                              .doc(_currentUser.uid);
                          await collection.set({
                            'userid': _currentUser.uid,
                            'username': _usernameController.text,
                            'age': _userAgeController.text,
                            'gender': _userGenderOption,
                            'location': _userLocationController.text
                          }, SetOptions(merge: true));
                          message = 'Data Updated Successfully';
                        } catch (e) {
                          print('Error Occured => ' + e.toString());
                          message = 'Error while updating Data';
                        }
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Update Data'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
