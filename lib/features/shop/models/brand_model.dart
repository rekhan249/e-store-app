class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  /// Empty helper function
  static BrandModel empty() => BrandModel(id: "", name: "", image: "");

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
      'productsCount': productsCount,
    };
  }

  factory BrandModel.fromMap(Map<String, dynamic> documnet) {
    final map = documnet;
    if (map.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      image: map['image'] ?? "",
      isFeatured: map['isFeatured'] != null ? map['isFeatured'] as bool : null,
      productsCount:
          map['productsCount'] != null ? map['productsCount'] as int : null,
    );
  }
}
