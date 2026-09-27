class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password
  });

  factory UserModel.fromJsom(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'], 
      email: json['email'], 
      password: json['password']
    );
  }
}