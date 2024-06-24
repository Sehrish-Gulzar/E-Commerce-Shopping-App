import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../features/shop/models/product_model.dart';
import '../../utils/constants/enums.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/format_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';
import '../services/firebase_storage_services.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get Limited Featured Products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
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

  /// Get All Featured Products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
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

  /// Get products using query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
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

  /// Get Products For Brand Products
  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection("Products")
              .where("Brand.Id", isEqualTo: brandId)
              .get()
          : await _db
              .collection("Products")
              .where("Brand.Id", isEqualTo: brandId)
              .limit(limit)
              .get();

      final products = querySnapshot.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();

      return products;
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

  /// Get Product based on Category
  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = 4}) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection("ProductCategory")
              .where("CategoryId", isEqualTo: categoryId)
              .get()
          : await _db
              .collection("ProductCategory")
              .where("CategoryId", isEqualTo: categoryId)
              .limit(limit)
              .get();

      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['ProductId'] as String)
          .toList();

      final productsQuery = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      List<ProductModel> products = productsQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
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

  /// Get products using query
  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs
          .map(
            (e) => ProductModel.fromSnapshot(e),
          )
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

  /// Upload dummy data to the cloud Firestore
  Future<void> uploadDummyProducts(List<ProductModel> products) async {
    try {
      final storage = Get.put(SgFirebaseStorageService());

      // long through each product
      for (var product in products) {
        // Get image data  link from locale assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // upload image and get url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign url to product.thumbnail attribute
        product.thumbnail = url;

        // product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get image data link from assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // Assign Url to attribute
            imagesUrl.add(url);
          }
          // Clear all old assets urls
          product.images!.clear();

          // add actual network urls
          product.images!.addAll(imagesUrl);
        }

        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // get image data link from asset
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // upload  image and get url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            // Assign url to variation.image
            variation.image = url;
          }
        }
        // Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
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
}
