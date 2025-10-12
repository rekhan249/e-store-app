class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, dynamic> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = "",
    this.image = "",
    this.description = "",
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Empty Helper function
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromMap(Map<String, dynamic> documnet) {
    final map = documnet;
    if (map.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
        id: map['id'] ?? "",
        sku: map['sku'] ?? "",
        image: map['image'] ?? "",
        description:
            map['description'] != null ? map['description'] as String : null,
        price: double.parse((map['price'] ?? 0.0).toString()),
        salePrice: double.parse((map['salePrice'] ?? 0.0).toString()),
        stock: map['stock'] as int,
        attributeValues: Map<String, dynamic>.from(
          (map['attributeValues']),
        ));
  }
}
