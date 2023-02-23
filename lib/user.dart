class User {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String pictureUrl;

  User({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.pictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as Map<String, dynamic>;
    final picture = json['picture'] as Map<String, dynamic>;

    return User(
      username: json['login']['username'] as String,
      firstName: name['first'] as String,
      lastName: name['last'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      pictureUrl: picture['large'] as String,
    );
  }
}
