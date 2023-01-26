import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class CloudFirestore {
  static uploadProfileImage(XFile image, User _currentUser) async {
    var downloadUrl;
    final collection = FirebaseFirestore.instance
        .collection('userProfileData')
        .doc(_currentUser.uid);

    final _firebaseStorage = FirebaseStorage.instance;
    // final _imagePicker = ImagePicker();
    // PickedFile image;

    // image = (await _imagePicker.getImage(source: ImageSource.gallery))!;
    var file = File(image.path);
    if (image != null) {
      // putting the image on cloud storage
      var snapshot = await _firebaseStorage
          .ref()
          .child('UserProfileImage/${_currentUser.uid}/ProfileImage')
          .putFile(file);
      downloadUrl = await snapshot.ref.getDownloadURL();

      //updating the profile link in the firestore.
      await collection.set({
        'userProfileImageUrl': downloadUrl,
      }, SetOptions(merge: true)).then(
          (value) => print('upload also successfull'));
    } else {
      print('No image path received');
    }
    return downloadUrl;
  }

  static retrieveProfileImageUrl(User _currentUser) async {
    final appCheckToken = await FirebaseAppCheck.instance.getToken();
    // print(appCheckToken);

    final _firebaseStorage = FirebaseStorage.instance;
    var downloadUrl = await _firebaseStorage
        .ref()
        .child('UserProfileImage/${_currentUser.uid}/ProfileImage')
        .getDownloadURL();
    print('Here we got this =>>>>> $downloadUrl');
    // return downloadUrl.toString();
  }
}
