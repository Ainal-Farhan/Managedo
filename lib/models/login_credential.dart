class LoginCredential {
  int id;
  String username;
  String password;
  int fkUserId;

  LoginCredential({
    this.id,
    this.fkUserId,
    this.username,
    this.password,
  });
  LoginCredential.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          fkUserId: json['fkUserId'],
          username: json['username'],
          password: json['password'],
        );
  LoginCredential.copy(LoginCredential from)
      : this(
          id: from.id,
          fkUserId: from.fkUserId,
          username: from.username,
          password: from.password,
        );
}
