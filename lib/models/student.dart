import './user.dart';
import './education.dart';
import './parent.dart';

class Student extends User {
  String matricNumber;
  List<Education> educations;
  List<Parent> parents;

  Student(
      {this.matricNumber,
      this.educations,
      this.parents,
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
  Student.fromJson(Map<String, dynamic> json)
      : this(
            matricNumber: json['matricNumber'],
            educations: json['educations'],
            parents: json['parents'],
            name: json['name'],
            profilePicURL: json['profilePicURL'],
            phoneNo: json['phoneNo'],
            gender: json['gender'],
            birthDate: json['birthDate'],
            email: json['email'],
            loginCredential: json['loginCredential']);
  Student.copy(Student from)
      : this(
            matricNumber: from.matricNumber,
            educations: from.educations
                .map((education) => Education.copy(education))
                .toList(),
            parents: from.parents.map((parent) => Parent.copy(parent)).toList(),
            name: from.name,
            profilePicURL: from.profilePicURL,
            phoneNo: from.phoneNo,
            gender: from.gender,
            birthDate: from.birthDate,
            email: from.email,
            loginCredential: from.loginCredential);
}
