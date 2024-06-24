import 'package:e_commerce_shopping_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_shopping_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_shopping_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_shopping_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/coupon_textfield.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../../personalization/controllers/address_controller.dart';
import '../../controllers/product/checkout_controller.dart';
import '../../controllers/product/order_controller.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());
    final subTotal = cartController.totalCartPrice.value;
    final totalAmount = SgPricingCalculator.calculateTotalPrice(subTotal, 'US');
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => (CheckoutController()));

    return Scaffold(
      appBar: SgAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SgSizes.defaultSpace),
          child: Column(
            children: [
              const SgCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: SgSizes.spaceBtwSections,
              ),

              /// Coupon TextField
              const SgCouponCode(),
              const SizedBox(
                height: SgSizes.spaceBtwSections,
              ),

              /// Billing Section
              SgRoundedContainer(
                padding: const EdgeInsets.all(SgSizes.md),
                showBorder: true,
                backgroundColor: dark ? SgColors.black : SgColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    SgBillingAmountSection(),
                    SizedBox(
                      height: SgSizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: SgSizes.spaceBtwItems,
                    ),

                    /// payment Methods
                    SgBillingPaymentSection(),
                    SizedBox(
                      height: SgSizes.spaceBtwItems,
                    ),

                    /// Address
                    SgBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SgSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0
              ? () => orderController.processOrder(totalAmount)
              : () => SgHelperFunctions.errorSnackBar(
                  title: 'Empty Cart',
                  message: 'Add items in the cart in order to proceed'),
          child: Text('Checkout \$$totalAmount'),
        ),
      ),
    );
  }
}
