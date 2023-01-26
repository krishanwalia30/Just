import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserWidget extends StatefulWidget {
  final String userid;
  final String username;
  final String age;
  final String location;
  final String gender;
  final String imageUrl;

  const UserWidget(
      {required this.age,
      required this.gender,
      required this.userid,
      required this.location,
      required this.username,
      required this.imageUrl});

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  late String _userAge;
  late String _userGender;
  late String _userName;
  late String _userLocation;
  late String _userImageUrl;

  @override
  void initState() {
    _userAge = widget.age;
    _userGender = widget.gender;
    _userLocation = widget.location;
    _userName = widget.username;
    _userImageUrl = widget.imageUrl;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_userImageUrl),
        ),
        color: Colors.blueGrey,
      ),
      margin: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_userName}\n ${_userAge} years old ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            // Text('${_userAge}'),
            // Text('${_userLocation}'),
          ],
        ),
      ),
    );
  }
}
