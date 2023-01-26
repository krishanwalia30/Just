// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class ImageUpload extends StatefulWidget {
//   const ImageUpload({super.key});

//   @override
//   State<ImageUpload> createState() => _ImageUploadState();
// }

// class _ImageUploadState extends State<ImageUpload> {
//   // function to upload the image
//   uploadImage() async {
//     final _firebaseStorage = FirebaseStorage.instance;
//     final _imagePicker = ImagePicker();
//     PickedFile image;
//     // check permissions
//     await Permission.photos.request();

//     var permissionStatus = await Permission.photos.status;

//     if (permissionStatus.isGranted) {
//       image = (await _imagePicker.getImage(source: ImageSource.gallery))!;

//       var file = File(image.path);

//       if (image != null) {
//         var snapshot =
//             await _firebaseStorage.ref().child('image/imageName').putFile(file);
//         var downloadUrl = await snapshot.ref.getDownloadURL();
//         setState(() {
//           imageUrl = downloadUrl;
//         });
//       } else {
//         print('No image path received');
//       }
//     } else {
//       print("permission not granted. Try Again with permission access");
//     }
//   }

//   late String imageUrl = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Upload Image',
//           style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.all(15),
//               padding: EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(15),
//                 ),
//                 border: Border.all(color: Colors.white),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     offset: Offset(2, 2),
//                     spreadRadius: 2,
//                     blurRadius: 1,
//                   ),
//                 ],
//               ),
//               child: (imageUrl == null)
//                   ? Image.network(imageUrl)
//                   : Image.network('https://i.imgur.com/sUFH1Aq.png'),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             ElevatedButton(
//               child: Text("Upload Image",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20)),
//               onPressed: () {
//                 uploadImage();
//               },
//               // shape: RoundedRectangleBorder(
//               //     borderRadius: BorderRadius.circular(18.0),
//               //     side: BorderSide(color: Colors.blue)),
//               // elevation: 5.0,
//               // color: Colors.blue,
//               // textColor: Colors.white,
//               // padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
//               // splashColor: Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

enum ImageSourceType { gallery, camera }

class ExamplePage extends StatelessWidget {
  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker Example"),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "Pick Image from Gallery",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.gallery);
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "Pick Image from Camera",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.camera);
                },
              ),
            ],
          ),
        ));
  }
}

class ImageFromGalleryEx extends StatefulWidget {
  final type;
  ImageFromGalleryEx(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  var _image;
  var imagePicker;
  var type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(type == ImageSourceType.camera
              ? "Image from Camera"
              : "Image from Gallery")),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 52,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Colors.red[200]),
                child: _image != null
                    ? Image.file(
                        _image,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        decoration: BoxDecoration(color: Colors.red[200]),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
