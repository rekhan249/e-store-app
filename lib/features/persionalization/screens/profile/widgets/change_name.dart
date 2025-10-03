import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/features/persionalization/controllers/change_name_controll.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:e_store_app/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameControll());
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(SizesLW.defaultSpaces),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),

            SizedBox(height: SizesLW.spacesBtwSections),

            /// Text field and Button
            Form(
              key: controller.changeNameFormKey,
              child: Column(
                children: [
                  /// First Name
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        EValidators.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TextStrings.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),

                  SizedBox(height: SizesLW.spaceBtwInputFields),

                  /// Last Name
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        EValidators.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: InputDecoration(
                      labelText: TextStrings.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: SizesLW.spacesBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
