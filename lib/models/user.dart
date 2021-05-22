// TODO need to change the profilePicURL data type later.

import './login_credential.dart';

class User {
  String name;
  String profilePicURL;
  String phoneNo;
  String gender;
  DateTime birthDate;
  String email;
  LoginCredential loginCredential;

  User(
      {this.name,
      this.profilePicURL,
      this.phoneNo,
      this.gender,
      this.birthDate,
      this.email,
      this.loginCredential});

  User.fromJson(Map<String, dynamic> json)
      : this(
            name: json['name'],
            profilePicURL: json['profilePicURL'],
            phoneNo: json['phoneNo'],
            gender: json['gender'],
            birthDate: json['birthDate'],
            email: json['email'],
            loginCredential: json['loginCredential']);

  User.copy(User from)
      : this(
            name: from.name,
            profilePicURL: from.profilePicURL,
            phoneNo: from.phoneNo,
            gender: from.gender,
            birthDate: from.birthDate,
            email: from.email,
            loginCredential: from.loginCredential);
}
