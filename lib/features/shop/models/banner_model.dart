import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel(
      {required this.imageUrl,
      required this.targetScreen,
      required this.active});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromMap(DocumentSnapshot snapShot) {
    final map = snapShot.data() as Map<String, dynamic>;
    return BannerModel(
        imageUrl: map['imageUrl'] ?? '',
        targetScreen: map['targetScreen'] ?? '',
        active: map['active'] ?? false);
  }
}
