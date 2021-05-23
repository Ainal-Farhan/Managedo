class LoginCredential {
  int id;
  int userId;
  String username;
  String password;

  LoginCredential({
    this.id,
    this.userId,
    this.username,
    this.password,
  });
  LoginCredential.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          userId: json['userId'],
          username: json['username'],
          password: json['password'],
        );
  LoginCredential.copy(LoginCredential from)
      : this(
          id: from.id,
          userId: from.userId,
          username: from.username,
          password: from.password,
        );
}
