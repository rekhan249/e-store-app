class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'values': values,
    };
  }

  factory ProductAttributeModel.fromMap(Map<String, dynamic> documnet) {
    final map = documnet;
    if (map.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
        name: map.containsKey('name') ? map['name'] : '',
        values: List<String>.from(map['values']));
  }
}
