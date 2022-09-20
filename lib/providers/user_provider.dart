

import 'package:flutter/cupertino.dart';
import 'package:instagram_clone_app/models/user.dart';
import 'package:instagram_clone_app/resources/auth_methods.dart';

class UserProvider with ChangeNotifier{

  final AuthMethods authMethods = AuthMethods();
  User? _user;

  User get getUser => _user!;


  Future<void> refreshUser() async {
    User user = await authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }

  
}