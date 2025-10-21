import 'package:e_store_app/features/shop/controllers/images_controller.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/features/shop/models/product_vari_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instnace => Get.find();

  /// variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = "".obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// --- Selected Attribute and Variations
  void anAttributeSelected(
      ProductModel productModel, attributeName, attributeValue) {
    /// When attribute is selected
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;
    final selectedVariation = productModel.productVariations!.firstWhere(
        (vary) =>
            _isSameAttributeValues(vary.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectProductImage.value =
          selectedVariation.image;
    }
    this.selectedVariation.value = selectedVariation;
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  /// -- Check attribute availability / Stock in Variation
  Set<ProductVariationModel> getAttributeAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where((vary) =>
            vary.attributeValues[attributeName] != null &&
            vary.attributeValues[attributeName]! &&
            vary.stock > 0)
        .toSet();

    return availableVariationAttributeValues;
  }

  /// ---
  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  /// -- Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? "In Stock" : "Out of Stock";
  }

  /// --- Reset Selected Atrribute when switching products
  void resetSelectedAttribute() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
