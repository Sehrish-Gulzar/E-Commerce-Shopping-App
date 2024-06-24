import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      this.isFeatured,
      this.productsCount});

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(
        id: '',
        image: '',
        name: '',
      );

  /// Convert Model to Json/Map
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductCount': productsCount
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'],
        image: data['Image'],
        name: data['Name'],
        isFeatured: data['IsFeatured'],
        productsCount: data['ProductCount']);
  }

  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      Map<String, dynamic> data = document.data()!;
      return BrandModel(
          id: data['Id'],
          image: data['Image'],
          name: data['Name'],
          isFeatured: data['IsFeatured'],
          productsCount: data['ProductCount']);
    } else {
      return BrandModel.empty();
    }
  }
}
