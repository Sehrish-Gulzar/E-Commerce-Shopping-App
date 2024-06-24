import 'dart:convert';

import 'package:get/get.dart';

import '../../../../data/repositories/product_repository.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../models/product_model.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  /// Variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // Method to initialize favourites by reading from storage
  Future<void> initFavourites() async {
    final json = await SgLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map(
        (key, value) => MapEntry(key, value as bool),
      ));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      SgHelperFunctions.customToast(
          message: 'Product has been added to the Wishlist');
    } else {
      SgLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      SgHelperFunctions.customToast(
          message: 'Product has been removed to the Wishlist');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = jsonEncode(favourites);
    SgLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    final productIds = favourites.keys.toList();
    return await ProductRepository.instance.getFavouriteProducts(productIds);
  }
}
