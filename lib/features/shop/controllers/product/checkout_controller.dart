import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/payment_method_model.dart';
import '../../screens/checkout/widgets/payment_tile.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  /// Variables
  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: SgImages.paypal);
    super.onInit();
  }

  ///
  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(SgSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SgSectionHeading(
                title: 'Select Payment Method',
              ),
              const SizedBox(
                height: SgSizes.spaceBtwSections,
              ),
              SgPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paypal', image: SgImages.paypal)),
              const SizedBox(
                height: SgSizes.spaceBtwItems / 2,
              ),
              SgPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Google Pay', image: SgImages.googlePay)),
              const SizedBox(
                height: SgSizes.spaceBtwItems / 2,
              ),
              SgPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Apple Pay', image: SgImages.applePay)),
              const SizedBox(
                height: SgSizes.spaceBtwItems / 2,
              ),
              SgPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'VISA', image: SgImages.visa)),
              const SizedBox(
                height: SgSizes.spaceBtwItems / 2,
              ),
              SgPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Master Card', image: SgImages.masterCard)),
              const SizedBox(
                height: SgSizes.spaceBtwItems / 2,
              ),
              SgPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'Paytm', image: SgImages.paytm)),
              const SizedBox(
                height: SgSizes.spaceBtwItems / 2,
              ),
              SgPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paystack', image: SgImages.paystack)),
              const SizedBox(
                height: SgSizes.spaceBtwItems / 2,
              ),
              SgPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Credit Card', image: SgImages.creditCard)),
              const SizedBox(
                height: SgSizes.spaceBtwItems / 2,
              ),
              const SizedBox(
                height: SgSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
