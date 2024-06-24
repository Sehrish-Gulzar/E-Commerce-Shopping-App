import 'package:e_commerce_shopping_app/utils/helpers/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    Get.put(NetworkManager());
    return Scaffold(
      appBar: SgAppBar(
        showBackArrow: true,
        title: Text(
          'Add new Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SgSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                /// Name
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      SgValidator.validateEmptyText("Name", value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(
                  height: SgSizes.spaceBtwInputFields,
                ),

                /// Phone
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) =>
                      SgValidator.validateEmptyText("Phone", value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'),
                ),
                const SizedBox(
                  height: SgSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      /// Street
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) =>
                            SgValidator.validateEmptyText("Street", value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: 'Street'),
                      ),
                    ),
                    const SizedBox(
                      width: SgSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      /// Postal Code
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) =>
                            SgValidator.validateEmptyText("Postal Code", value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'Postal Code'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SgSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      /// City
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            SgValidator.validateEmptyText("City", value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'City'),
                      ),
                    ),
                    const SizedBox(
                      width: SgSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      /// State
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            SgValidator.validateEmptyText("State", value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'State'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SgSizes.spaceBtwInputFields,
                ),

                /// Country
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      SgValidator.validateEmptyText("Country", value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(
                  height: SgSizes.spaceBtwInputFields * 2,
                ),

                /// Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.addNewAddress(),
                      child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
