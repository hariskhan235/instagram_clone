import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postId;
  final String username;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  Post(
      {required this.description,
      required this.uid,
      required this.postId,
      required this.username,
      required this.datePublished,
      required this.postUrl,
      required this.profImage,
      required this.likes});

  // User.fromJson(Map<String,dynamic> json){
  //   return User(email: json['email'], uid: uid, photoUrl: photoUrl, username: username, bio: bio, followers: followers, following: following)
  // }

  Map<String, dynamic> toJson() => {
        'username': username,
        'postId': postId,
        'description': description,
        'uid': uid,
        'datePublished': datePublished,
        'likes': likes,
        'postUrl': postUrl,
        'profImage': profImage
      };

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        description: json['description'],
        uid: json['uid'],
        postId: json['postId'],
        username: json['username'],
        datePublished: json['datePublished'],
        postUrl: json['postUrl'],
        profImage: json['profImage'],
        likes: json['likes']);
  }

  static Post fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return Post(
        description: snap['description'],
        uid: snap['uid'],
        postId: snap['postId'],
        username: snap['username'],
        datePublished: snap['datePublished'],
        postUrl: snap['postUrl'],               
        profImage: snap['profImage'],
        likes: snap['likes']);
  }
}
