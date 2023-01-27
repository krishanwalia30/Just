import 'package:flutter/material.dart';

class OtherProfilePage extends StatefulWidget {
  final String userid;
  final String username;
  final String age;
  final String location;
  final String gender;
  final String imageUrl;

  const OtherProfilePage(
      {required this.age,
      required this.gender,
      required this.userid,
      required this.location,
      required this.username,
      required this.imageUrl});

  @override
  State<OtherProfilePage> createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
  late String _userAge;
  late String _userGender;
  late String _userName;
  late String _userLocation;
  late String _userImageUrl;
  late String _userId;

  @override
  void initState() {
    _userId = widget.userid;
    _userAge = widget.age;
    _userGender = widget.gender;
    _userLocation = widget.location;
    _userName = widget.username;
    _userImageUrl = widget.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_userName)),
      body: Hero(
        tag: _userId,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.amber),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 7),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 80,
                      child: Image(
                        image: NetworkImage(_userImageUrl),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  children: [
                    // For the Username
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Name:',
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.green,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          _userName,
                          style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),

                    // For the Age of the User
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Age :',
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.green,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          _userAge,
                          style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),

                    // For the Location of the User
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Location :',
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.green,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          _userLocation,
                          style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),

                    // For the Gender of the User
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Gender :',
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.green,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          _userGender,
                          style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent),
                        )
                      ],
                    ),
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
