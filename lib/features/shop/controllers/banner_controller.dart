import 'package:get/get.dart';

import '../../../data/repositories/banner/banner_repository.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;
  final repo = Get.put(BannerRepository());

  /// Update Banner Navigational Dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  @override
  void onInit() {
    //repo.uploadDummyBanners(SgDummyData.banners);
    fetchBanners();
    super.onInit();
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Start Loading
      isLoading.value = true;

      // fetch banners
      final banners = await repo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      // Show Error SnackBar
      SgHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Stop Loading
      isLoading.value = false;
    }
  }
}
