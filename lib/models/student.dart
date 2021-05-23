import './user.dart';

class Student extends User {
  int id;
  String matricNumber;
  List<int> educationsId;
  List<int> parentsId;

  Student({
    this.matricNumber,
    this.educationsId,
    this.parentsId,
    User user,
  }) : super(
          name: user.name,
          profilePicURL: user.profilePicURL,
          phoneNo: user.phoneNo,
          gender: user.gender,
          birthDate: user.birthDate,
          email: user.email,
          loginCredentialId: user.loginCredentialId,
        );
  Student.fromJson(
      Map<String, dynamic> jsonStudent, Map<String, dynamic> jsonUser)
      : this(
          matricNumber: jsonStudent['matricNumber'],
          educationsId: [...jsonStudent['educationsId']],
          parentsId: [...jsonStudent['parentsId']],
          user: User.fromJson(jsonUser),
        );
  Student.copy(Student from)
      : this(
          matricNumber: from.matricNumber,
          educationsId: [...from.educationsId],
          parentsId: [...from.parentsId],
          user: User.copy(from),
        );
}
