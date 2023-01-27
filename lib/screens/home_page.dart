import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:just/colors.dart';

import 'package:just/screens/user_profile_page.dart';
import 'package:just/widgets/userWidget.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({required this.user});
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.color6,
          centerTitle: true,
          title: Image.asset('assets/just.png'),
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
        body: Container(
          decoration: BoxDecoration(color: MyColors.color1),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    print('');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserProfilePage(
                        user: _currentUser,
                      ),
                    ));
                  },

                  // Container for the Update your profile option
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.color6,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Ink(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          'Update Your Profile',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('userProfileData')
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Text('PLease Wait')
                        : Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot Data =
                                    snapshot.data!.docs[index];

                                return UserWidget(
                                  age: Data['age'],
                                  userid: Data['userid'],
                                  username: Data['username'],
                                  location: Data['location'],
                                  gender: Data['gender'],
                                  imageUrl: Data['userProfileImageUrl'],
                                );
                              },
                            ),
                          );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
