import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_services.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Fetch All brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection("Brands").get();
      return snapshot.docs
          .map((brand) => BrandModel.fromJson(brand.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw SgFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SgFormatException();
    } on PlatformException catch (e) {
      throw SgPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get brands for specific category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection("BrandCategory")
          .where("CategoryId", isEqualTo: categoryId)
          .get();

      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['BrandId'] as String)
          .toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in collection
      final brandsQuery = await _db
          .collection("Brands")
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      final brands =
          brandsQuery.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw SgFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SgFormatException();
    } on PlatformException catch (e) {
      throw SgPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Dummy Brands
  Future<void> uploadDummyBrands(List<BrandModel> brands) async {
    try {
      final storage = Get.put(SgFirebaseStorageService());

      for (var brand in brands) {
        final imageFile = await storage.getImageDataFromAssets(brand.image);

        String imageUrl =
            await storage.uploadImageData("Brands", imageFile, brand.name);

        brand.image = imageUrl;

        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
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
