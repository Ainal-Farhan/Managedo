import 'package:managedo_mobile_app/models/student_relationship.dart';

import './user.dart';
import './student_relationship.dart';

class Parent extends User {
  List<StudentRelationship> studentRelations;

  Parent(
      {this.studentRelations,
      name,
      profilePicURL,
      phoneNo,
      gender,
      birthDate,
      email,
      loginCredential})
      : super(
            name: name,
            profilePicURL: profilePicURL,
            phoneNo: phoneNo,
            gender: gender,
            birthDate: birthDate,
            email: email,
            loginCredential: loginCredential);
  Parent.fromJson(Map<String, dynamic> json)
      : this(
            studentRelations: json['studentRelations'],
            name: json['name'],
            profilePicURL: json['profilePicURL'],
            phoneNo: json['phoneNo'],
            gender: json['gender'],
            birthDate: json['birthDate'],
            email: json['email'],
            loginCredential: json['loginCredential']);
  Parent.copy(Parent from)
      : this(
            studentRelations: from.studentRelations
                .map((studentRelation) =>
                    StudentRelationship.copy(studentRelation))
                .toList(),
            name: from.name,
            profilePicURL: from.profilePicURL,
            phoneNo: from.phoneNo,
            gender: from.gender,
            birthDate: from.birthDate,
            email: from.email,
            loginCredential: from.loginCredential);
}
