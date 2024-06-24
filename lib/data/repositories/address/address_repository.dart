import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/address_model.dart';
import '../authentication/authentication_repository.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes';
      }

      final snapshot = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .get();
      final result = snapshot.docs
          .map(
            (e) => AddressModel.fromDocumentSnapshot(e),
          )
          .toList();

      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Clear the "selected" field for all addresses
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .doc(addressId)
          .update({'SelectedAddress': selected});
    } catch (e) {
      throw 'Unable to update your address selection. Try again later';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong while saving Address Information. Try again later';
    }
  }
}
