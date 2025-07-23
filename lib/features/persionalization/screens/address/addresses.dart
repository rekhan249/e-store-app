import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/features/persionalization/screens/address/add_new_address.dart';
import 'package:e_store_app/features/persionalization/screens/address/widgets/single_address.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Addresses extends StatelessWidget {
  const Addresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          showBackArrow: true,
          title: Text("Addresses",
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizesLW.defaultSpaces),
          child: Column(
            children: [
              SingleAddress(selectedAddress: false),
              SingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: EStoreColors.primary,
        onPressed: () => Get.to(() => AddNewAddress()),
        child: Icon(Iconsax.add, color: EStoreColors.white),
      ),
    );
  }
}
