class LoginCredential {
  String username;
  String password;
  String userType;

  LoginCredential({this.username, this.password, this.userType});
  LoginCredential.fromJson(Map<String, dynamic> json)
      : this(
            username: json['username'],
            password: json['password'],
            userType: json['userType']);
  LoginCredential.copy(LoginCredential from)
      : this(
            username: from.username,
            password: from.password,
            userType: from.userType);
}
