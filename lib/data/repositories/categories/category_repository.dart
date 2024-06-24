import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_category_model.dart';
import '../../../features/shop/models/category_model.dart';
import '../../../features/shop/models/product_category_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_services.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    //uploadDummyData(SgDummyData.categories);
    super.onInit();
  }

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Category").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw SgFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SgPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Get sub categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection("Category")
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result = snapshot.docs
          .map(
            (e) => CategoryModel.fromSnapshot(e),
          )
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw SgFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SgPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Upload Categories to the Cloud Firestore
  Future<void> uploadDummyCategories(List<CategoryModel> categories) async {
    try {
      // Upload all categories along with their image
      final storage = Get.put(SgFirebaseStorageService());

      // load through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload Image and get its url
        final url =
            await storage.uploadImageData('Category', file, category.name);

        // Assign url to Category.image attribute
        category.image = url;

        // Storage Category in Firestore
        await _db
            .collection('Category')
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw SgFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SgPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadDummyProductCategory(
      List<ProductCategoryModel> productCategories) async {
    try {
      for (var productCategory in productCategories) {
        await _db
            .collection("ProductCategory")
            .doc()
            .set(productCategory.toJson());
      }
    } on FirebaseException catch (e) {
      throw SgFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SgPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadDummyBrandCategory(
      List<BrandCategoryModel> brandCategories) async {
    try {
      for (var brandCategory in brandCategories) {
        await _db.collection("BrandCategory").doc().set(brandCategory.toJson());
      }
    } on FirebaseException catch (e) {
      throw SgFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SgPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
