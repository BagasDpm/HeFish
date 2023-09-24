class User {
  final int idUser;
  final String email;
  final String username;
  final String password;
  final String token;

  User({
    required this.idUser,
    required this.email,
    required this.username,
    required this.password,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json["id_user"] as int,
      email: json["email"].toString(),
      username: json["username"].toString(),
      password: json["password"].toString(),
      token: json["token"].toString(),
    );
  }
}
