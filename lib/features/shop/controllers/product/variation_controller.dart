import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';
import '../../models/product_model.dart';
import '../../models/product_variation_model.dart';
import 'cart_controller.dart';
import 'images_controller.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// Select Attribute and Variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    try {
      Map<String, dynamic> selectedAttributes =
          Map<String, dynamic>.from(this.selectedAttributes);
      selectedAttributes[attributeName] = attributeValue;
      this.selectedAttributes[attributeName] =
          attributeValue; // i.e: selectedAttribute['Color'] : 'Green'

      ProductVariationModel selectedVariation =
          product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty(),
      );

      // Show the selected variation image as a Main Image
      if (selectedVariation.image.isNotEmpty) {
        ImagesController.instance.selectedProductImage.value =
            selectedVariation.image;
      }

      // Show selected variation quantity already in the cart
      if (selectedVariation.id.isNotEmpty) {
        final cartController = CartController.instance;
        cartController.productQuantityInCart.value = cartController
            .getVariationQuantityInCart(product.id, selectedVariation.id);
      }

      // Assign Selected Variation to Rx
      this.selectedVariation.value = selectedVariation;
      getProductVariationStockStatus();
    } catch (e) {
      if (e.toString() == 'Bad state: No element') {
        SgHelperFunctions.errorSnackBar(
            title: 'Oh Snap!', message: 'Product is not available');
      }
    }
  }

  /// Check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // if selectedAttributes contains 3 attributes and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attribute is different then return e.g [Green, Large] != [Green, Small]
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  /// Check Attribute availability / Stock in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    // Pass the variation to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.attributeValues[attributeName] != null &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toStringAsFixed(0);
  }

  /// Check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
