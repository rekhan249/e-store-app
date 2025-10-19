import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/features/shop/models/product_vari_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instnace => Get.find();

  /// variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = "".obs;
  Rx<ProductVariationModel> selectedVariations =
      ProductVariationModel.empty().obs;

  /// --- Selected Attribute and Variations
  void anAttributeSelected(
      ProductModel productModel, attributeName, attributeValue) {}

  /// -- Check attribute availability / Stock in Variation
  Set<String?> getAttributeAvailabilityInVariation(
      List<ProductVariationModel> variations, String attribute) {
    /// do something
  }

  /// -- Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariations.value.stock > 0 ? "In Stock" : "Out of Stock";
  }

  /// --- Reset Selected Atrribute when switching products
  void resetSelectedAttribute() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariations.value = ProductVariationModel.empty();
  }
}
