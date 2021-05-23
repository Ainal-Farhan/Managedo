import './user.dart';

class Parent extends User {
  int id;
  List<int> studentRelationsId;

  Parent({
    this.id,
    this.studentRelationsId,
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
  Parent.fromJson(
      Map<String, dynamic> jsonParent, Map<String, dynamic> jsonUser)
      : this(
          id: jsonParent['id'],
          studentRelationsId: [...jsonParent['studentRelationsId']],
          user: User.fromJson(jsonUser),
        );
  Parent.copy(Parent from)
      : this(
          id: from.id,
          studentRelationsId: [...from.studentRelationsId],
          user: User.copy(from),
        );
}
