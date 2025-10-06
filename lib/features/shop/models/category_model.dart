import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String parentId;
  final bool isFeatured;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      this.parentId = "",
      required this.isFeatured});

  /// Empty helper funcion
  static CategoryModel empty() =>
      CategoryModel(id: "", name: "", image: "", isFeatured: false);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'parentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  factory CategoryModel.fromMap(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final map = document.data()!;
      return CategoryModel(
        id: document.id,
        name: map['name'] ?? "",
        image: map['image'] ?? "",
        parentId: map['parentId'] ?? "",
        isFeatured: map['isFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
