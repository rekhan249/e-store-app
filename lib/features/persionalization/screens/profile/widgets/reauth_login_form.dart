import 'package:e_store_app/features/persionalization/controllers/user_controller_google.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:e_store_app/utils/contants/text_strings.dart';
import 'package:e_store_app/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserControllerGoogle.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(SizesLW.defaultSpaces),
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Email Field
              TextFormField(
                controller: controller.verifyEmail,
                validator: (value) => EValidators.validateEmail(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TextStrings.email,
                ),
              ),

              SizedBox(height: SizesLW.spaceBtwInputFields),

              /// Password Field
              Obx(() => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        EValidators.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      labelText: TextStrings.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.profileLoader.value =
                            !controller.profileLoader.value,
                        icon: Icon(controller.profileLoader.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                      ),
                    ),
                  )),

              SizedBox(height: SizesLW.spacesBtwSections),

              /// Verify Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      controller.reAuthenticateBeforeDeleteUserAccount(),
                  child: Text('Verify'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
