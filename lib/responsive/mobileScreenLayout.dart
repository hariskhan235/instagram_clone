
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../models/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

  String username = '';

  // @override
  // void initState() {
  //   // TODO: implement initState

  //   getUserName();
  //   super.initState();
  // }

  // getUserName() async {
  //  DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();

  //  setState(() {
  //    username = (snapshot.data() as Map<String,dynamic>)['username'];
  //  });
  //  //print(snapshot.data());
  // }
  @override
  Widget build(BuildContext context) {

    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: Text(user.username),
      ),
    );
  }
}