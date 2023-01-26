import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just/utils/cloud_storage.dart';

import 'login_page.dart';

class ImageUpload extends StatefulWidget {
  final User user;
  ImageUpload({super.key, required this.user});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  late User _currentUser;

  late var imageUrl = '';
  var _image;
  var imagePicker;

  @override
  void initState() {
    _currentUser = widget.user;
    imagePicker = new ImagePicker();
    imageUrl = CloudFirestore.retrieveProfileImageUrl(_currentUser).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile picture'),
        actions: [
          InkWell(
            child: Icon(Icons.logout),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          )
        ],
      ),
      body: Column(children: <Widget>[
        const SizedBox(height: 52),
        Center(
          child: GestureDetector(
              onTap: () async {
                var source = ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                  source: source,
                  imageQuality: 50,
                );
                // uploadProfileImage(image,_currentUser);
                setState(() {
                  imageUrl =
                      CloudFirestore.uploadProfileImage(image, _currentUser);
                  print('Upload is done and the url is ' + imageUrl);
                });
                // setState(() {
                //   _image = File(image.path);
                // });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Colors.red[200]),
                child: (imageUrl == "")
                    ? Text('Select an Image')
                    // : Text('Please Wait'),
                    // : Image.network(
                    //     CloudFirestore.retrieveProfileImageUrl(_currentUser)
                    //         .toString(),
                    //   )),
                    : Image.network(imageUrl),
              )),
        ),
      ]),
    );
  }

  uploadImage(XFile image) async {
    final _firebaseStorage = FirebaseStorage.instance;
    // final _imagePicker = ImagePicker();
    // PickedFile image;

    // image = (await _imagePicker.getImage(source: ImageSource.gallery))!;
    var file = File(image.path);
    if (image != null) {
      var snapshot = await _firebaseStorage
          .ref()
          .child('UserProfileImage/${_currentUser.uid}/ProfileImage')
          .putFile(file)
          .whenComplete(() => print('upload done'));
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
      });
    } else {
      print('No image path received');
    }
  }
}
