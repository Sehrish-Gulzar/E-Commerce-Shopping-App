import 'package:e_commerce_shopping_app/features/shop/controllers/product/variation_controller.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/enums.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../models/cart_item_model.dart';
import '../../models/product_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  String cartItemsKey = 'CartItems';

  CartController() {
    loadCartItems();
  }

  /// Variables
  RxInt noOfCartItem = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  final variationController = VariationController.instance;

  /// Add items in the cart
  void addToCart(ProductModel product) {
    // Quantity check
    if (productQuantityInCart < 1) {
      SgHelperFunctions.customToast(message: 'Select Quantity');
      return;
    }

    // Variation Selected?
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      SgHelperFunctions.customToast(message: 'Select Variation');
      return;
    }

    // Out of stock status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        SgHelperFunctions.warningSnackBar(
            title: 'Oh Snap!', message: 'Selected variation is out of stock');
        return;
      }
    } else {
      if (product.stock < 1) {
        SgHelperFunctions.warningSnackBar(
            title: 'Oh Snap!', message: 'Selected variation is out of stock');
        return;
      }
    }

    // Convert the Product Model to a CartItemModel with the given quantity
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    // Check if already added in the cart
    int index = cartItems.indexWhere(
      (cartItem) =>
          cartItem.productId == selectedCartItem.productId &&
          selectedCartItem.variationId == cartItem.variationId,
    );

    if (index >= 0) {
      // This quantity is already added or updated/removed from the design Cart(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();

    SgHelperFunctions.customToast(
        message: 'Your product has been added to the Cart');
  }

  /// Add One Item to cart
  void addOneToCart(CartItemModel item) {
    final index = cartItems.indexWhere(
      (cartItem) =>
          item.productId == cartItem.productId &&
          item.variationId == cartItem.variationId,
    );

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  /// Remove one item from the cart
  void removeOneFromCart(CartItemModel item) {
    final index = cartItems.indexWhere(
      (cartItem) =>
          cartItem.productId == item.productId &&
          cartItem.variationId == item.variationId,
    );

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // Show dialog before completely removing
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
        title: 'Remove Product',
        middleText: 'Are you sure you want to remove this product?',
        onConfirm: () {
          // Remove the item from the cart
          cartItems.removeAt(index);
          updateCart();
          SgHelperFunctions.customToast(
              message: 'Product removed from the cart');
          Get.back();
        },
        onCancel: () => Get.back());
  }

  /// This function converts ProductModel to CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // Reset Variation in case of single product type
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final image = isVariation ? variation.image : product.thumbnail;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;
    return CartItemModel(
        productId: product.id,
        quantity: quantity,
        brandName: product.brand != null ? product.brand!.name : '',
        variationId: variation.id,
        image: image,
        price: price,
        title: product.title,
        selectedVariation: isVariation ? variation.attributeValues : null);
  }

  /// Update Cart values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  /// update total price & No.of items of cart
  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItem.value = calculatedNoOfItems;
  }

  /// Save cart items into local storage
  void saveCartItems() {
    final cartItemStrings = cartItems
        .map(
          (item) => item.toJson(),
        )
        .toList();
    SgLocalStorage.instance().saveData(cartItemsKey, cartItemStrings);
  }

  /// Load All the cart items from storage
  void loadCartItems() {
    final cartItemStrings =
        SgLocalStorage.instance().readData<List<dynamic>>(cartItemsKey);
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings.map(
        (item) => CartItemModel.fromJson(item as Map<String, dynamic>),
      ));
      updateCartTotals();
    }
  }

  /// get total quantity of same specific product
  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where(
          (item) => item.productId == productId,
        )
        .fold(0, (previousValue, item) => previousValue + item.quantity);
    return foundItem;
  }

  /// get variation's quantity of the specific product
  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());

    return foundItem.quantity;
  }

  /// clear the cart
  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  /// Initialize already added item's count in the cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    // If product has no variations then calculate cartEntries and display total number
    // Else make default entries to 0 and show cartEntries when variation is selected
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }
}
