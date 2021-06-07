import './user.dart';

class Student extends User {
  int id;
  String matricNumber;

  Student({
    this.matricNumber,
    User user,
  }) : super(
          name: user.name,
          profilePicURL: user.profilePicURL,
          phoneNo: user.phoneNo,
          gender: user.gender,
          birthDate: user.birthDate,
          email: user.email,
          fkStudentId: user.fkStudentId,
          fkParentId: user.fkParentId,
        );
  Student.fromJson(
      Map<String, dynamic> jsonStudent, Map<String, dynamic> jsonUser)
      : this(
          matricNumber: jsonStudent['matricNumber'],
          user: User.fromJson(jsonUser),
        );
  Student.copy(Student from)
      : this(
          matricNumber: from.matricNumber,
          user: User.copy(from),
        );
}
