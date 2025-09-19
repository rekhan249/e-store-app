class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String profilePicture;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.password,
      required this.profilePicture});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      profilePicture: map['profilePicture']);
}
