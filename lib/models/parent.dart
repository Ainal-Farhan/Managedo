import './user.dart';

class Parent extends User {
  int id;

  Parent({
    this.id,
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
  Parent.fromJson(
      Map<String, dynamic> jsonParent, Map<String, dynamic> jsonUser)
      : this(
          id: jsonParent['id'],
          user: User.fromJson(jsonUser),
        );
  Parent.copy(Parent from)
      : this(
          id: from.id,
          user: User.copy(from),
        );

  Map<String, dynamic> toJson() => {
    'id': this.id,
  };
}
