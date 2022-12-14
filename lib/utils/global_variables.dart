import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/screens/add_post_screen.dart';
import 'package:instagram_clone_app/screens/feed_screen.dart';
import 'package:instagram_clone_app/screens/profile_screen.dart';
import 'package:instagram_clone_app/screens/search_screen.dart';

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Center(
    child: Text('Notification'),
  ),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  )
];
