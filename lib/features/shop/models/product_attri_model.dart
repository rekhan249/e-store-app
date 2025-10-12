class ProductAttributeModel {
  String? name;
  final List<String>? value;

  ProductAttributeModel({this.name, this.value});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory ProductAttributeModel.fromMap(Map<String, dynamic> documnet) {
    final map = documnet;
    if (map.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
        name: map.containsKey('name') ? map['name'] : '',
        value: List<String>.from(map['value']));
  }
}
