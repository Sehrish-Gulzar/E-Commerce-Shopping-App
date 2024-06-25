import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../../../data/repositories/product_repository.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  /// Variables
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxBool isLoading = false.obs;
  final categoryRepository = Get.put(CategoryRepository());

  @override
  void onInit() {
    //categoryRepository.uploadDummyData(SgDummyData.categories);
    fetchCategories();

    super.onInit();
  }

  /// Load Category Data
  Future<void> fetchCategories() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch Categories from data source (Firebase, API, etc)
      final categories = await categoryRepository.getAllCategories();

      // Update Rx Categories List
      allCategories.assignAll(categories);

      // Filter Featured Categories
      featuredCategories.assignAll(categories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      SgHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// Load Selected Category Data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      SgHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Get limited Category or Sub_Category Products
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      SgHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  ///Get all Category or Sub_Category Products
  Future<List<ProductModel>> getAllCategoryProducts(
      {required String categoryId}) async {
    try {
      final products =
          await ProductRepository.instance.getAllProductsForCategory(
        categoryId: categoryId,
      );
      return products;
    } catch (e) {
      SgHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
