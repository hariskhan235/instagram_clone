import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  User(
      {required this.email,
      required this.uid,
      required this.photoUrl,
      required this.username,
      required this.bio,
      required this.followers,
      required this.following});

  // User.fromJson(Map<String,dynamic> json){
  //   return User(email: json['email'], uid: uid, photoUrl: photoUrl, username: username, bio: bio, followers: followers, following: following)
  // }

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'photoUrl': photoUrl,
        'uid': uid,
        'bio': bio,
        'followers': followers,
        'following': following,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        uid: json['uid'],
        photoUrl: json['photoUrl'],
        username: json['username'],
        bio: json['bio'],
        followers: json['followers'],
        following: json['following']);
  }

  static User fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return User(
        email: snapshot['email'],
        uid: snapshot['uid'],
        photoUrl: snapshot['photoUrl'],
        username: snapshot['username'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following']);
  }
}
