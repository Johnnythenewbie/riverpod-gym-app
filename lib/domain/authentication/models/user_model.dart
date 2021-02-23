import 'package:flutter/foundation.dart';
import 'package:gym_tracker/domain/authentication/auth_repository.dart';

class UserModel {
  String userName;
  String uid;
  String email;
  String profileImageURL;

  UserModel(
      {@required this.userName,
      @required this.uid,
      @required this.email,
      @required this.profileImageURL});

  UserModel.fromDocumentSnapshot(Map<String, dynamic> json) {
    this.uid = json['uid'];
    this.userName = json['displayName'];
    this.email = json['email'];
  }

  ///Creates a new [UserModel] object with empty strings to counter null values
  UserModel.initValue() {
    this.userName = '';
    this.uid = '';
    this.profileImageURL = '';
    this.email = '';
  }

  UserModel.fromAuthProvider(AuthRepository authProvider) {
    this.uid = authProvider.uid;
    this.userName = authProvider.userName;
    this.email = authProvider.email;
    // this.profileImageURL = authProvider.profileImageURL ?? '';
  }

  @override
  String toString() {
    return 'username: $userName || email: $email || uid: $uid';
  }
}
