import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/order/order_repository.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/controllers/address_controller.dart';
import '../../models/order_model.dart';
import 'cart_controller.dart';
import 'checkout_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();

      return userOrders;
    } catch (e) {
      print(e);
      SgHelperFunctions.warningSnackBar(
          title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      SgFullScreenLoader.openLoadingDialog(
          'Processing your order...', SgImages.emptyAnimation);

      // Get user authentication id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
          // Generate the unique id for the order
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          // Set date as needed
          deliveryDate: DateTime.now(),
          items: cartController.cartItems.toList());

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // update the cart status
      cartController.clearCart();

      // Show Success Screen
      Get.off(() => SuccessScreen(
            image: SgImages.successfulPaymentIcon,
            title: 'Payment Success!',
            subtitle: 'Your item will be shipped soon!',
            onPress: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      SgHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
