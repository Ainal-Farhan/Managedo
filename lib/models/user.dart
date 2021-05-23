class User {
  int id;
  String name;
  String profilePicURL;
  String phoneNo;
  String gender;
  DateTime birthDate;
  String email;
  String userType;
  int userTypeId;
  int loginCredentialId;

  User({
    this.id,
    this.name,
    this.profilePicURL,
    this.phoneNo,
    this.gender,
    this.birthDate,
    this.email,
    this.userType,
    this.userTypeId,
    this.loginCredentialId,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          profilePicURL: json['profilePicURL'],
          phoneNo: json['phoneNo'],
          gender: json['gender'],
          birthDate: DateTime.parse(json['birthDate']),
          email: json['email'],
          userType: json['userType'],
          userTypeId: json['userTypeId'],
          loginCredentialId: json['loginCredentialId'],
        );

  User.copy(User from)
      : this(
          id: from.id,
          name: from.name,
          profilePicURL: from.profilePicURL,
          phoneNo: from.phoneNo,
          gender: from.gender,
          birthDate: from.birthDate,
          email: from.email,
          userType: from.userType,
          userTypeId: from.userTypeId,
          loginCredentialId: from.loginCredentialId,
        );
}
