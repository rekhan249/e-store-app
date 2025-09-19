import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/utils/formatters/e_formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNum;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.phoneNum,
      required this.profilePicture});

  /// Helper function to get fullname
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number
  String get formatPhoneNo => EFormatters.formatPhoneNo(phoneNum);

  /// Helper function to split fullname to parts
  static List<String> nameParts(fullName) => fullName.toString().split(" ");

  /// static function to generate username from fullname
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.toString().split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String snaneCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$snaneCaseUserName";
    return userNameWithPrefix;
  }

  /// static function to create empty user model
  static UserModel empty() => UserModel(
      id: "",
      firstName: "",
      lastName: "",
      username: "",
      email: "",
      phoneNum: "",
      profilePicture: "");

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNo': phoneNum,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromMap(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final map = document.data()!;
      return UserModel(
          id: document.id,
          firstName: map['firstName'] ?? "",
          lastName: map['lastName'] ?? "",
          username: map['username'] ?? "",
          email: map['email'] ?? "",
          phoneNum: map['phoneNum'] ?? "",
          profilePicture: map['profilePicture'] ?? "");
    } else {
      return UserModel.empty();
    }
  }
}
