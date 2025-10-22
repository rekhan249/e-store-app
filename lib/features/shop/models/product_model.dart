import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app/features/shop/models/brand_model.dart';
import 'package:e_store_app/features/shop/models/product_attri_model.dart';
import 'package:e_store_app/features/shop/models/product_vari_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAtrributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAtrributes,
    this.productVariations,
  });

  /// empty helper function
  static ProductModel empty() => ProductModel(
      id: "", stock: 0, price: 0, title: "", thumbnail: "", productType: "");
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stock': stock,
      'sku': sku,
      'price': price,
      'title': title,
      'date': date?.millisecondsSinceEpoch,
      'salePrice': salePrice,
      'thumbnail': thumbnail,
      'isFeatured': isFeatured,
      'brand': brand?.toMap(),
      'description': description,
      'categoryId': categoryId,
      'images': images ?? [],
      'productType': productType,
      'productAtrributes': productAtrributes != null
          ? productAtrributes!.map((x) => x.toMap()).toList()
          : [],
      'productVariations': productVariations != null
          ? productVariations!.map((x) => x.toMap()).toList()
          : [],
    };
  }

  factory ProductModel.fromMap(
      DocumentSnapshot<Map<String, dynamic>> documnet) {
    final map = documnet.data()!;
    return ProductModel(
        id: documnet.id,
        stock: map['stock'],
        sku: map['sku'],
        price: double.parse((map['price'] ?? 0.0).toString()),
        title: map['title'],
        date: map['date'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
            : null,
        salePrice: double.parse((map['salePrice'] ?? 0.0).toString()),
        thumbnail: map['thumbnail'] ?? '',
        isFeatured: map['isFeatured'] ?? false,
        brand: BrandModel.fromMap(map['brand']),
        description: map['description'] ?? "",
        categoryId: map['categoryId'] ?? "",
        images: map['images'] != null ? List<String>.from((map['images'])) : [],
        productType: map['productType'] ?? "",
        productAtrributes: (map["productAtrributes"] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromMap(e))
            .toList(),
        productVariations: (map["productVariations"] as List<dynamic>)
            .map(
              (e) => ProductVariationModel.fromMap(e),
            )
            .toList());
  }

  /// from Firebase to Model
  factory ProductModel.fromQuerySnapShot(
      QueryDocumentSnapshot<Object?> document) {
    final map = document.data() as Map<String, dynamic>;
    return ProductModel(
        id: document.id,
        stock: map['stock'],
        sku: map['sku'],
        price: double.parse((map['price'] ?? 0.0).toString()),
        title: map['title'],
        date: map['date'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
            : null,
        salePrice: double.parse((map['salePrice'] ?? 0.0).toString()),
        thumbnail: map['thumbnail'] ?? '',
        isFeatured: map['isFeatured'] ?? false,
        brand: BrandModel.fromMap(map['brand']),
        description: map['description'] ?? "",
        categoryId: map['categoryId'] ?? "",
        images: map['images'] != null ? List<String>.from((map['images'])) : [],
        productType: map['productType'] ?? "",
        productAtrributes: (map["productAtrributes"] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromMap(e))
            .toList(),
        productVariations: (map["productVariations"] as List<dynamic>)
            .map(
              (e) => ProductVariationModel.fromMap(e),
            )
            .toList());
  }
}
