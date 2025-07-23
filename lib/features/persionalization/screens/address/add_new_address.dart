import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(showBackArrow: true, title: Text("Add New Address")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesLW.defaultSpaces),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Name", prefixIcon: Icon(Iconsax.user))),
              SizedBox(height: SizesLW.spaceBtwInputFields),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Phone No,",
                      prefixIcon: Icon(Iconsax.mobile))),
              SizedBox(height: SizesLW.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Street",
                        prefixIcon: Icon(Iconsax.building_31)),
                  )),
                  SizedBox(width: SizesLW.spaceBtwInputFields / 2),
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Postal Code",
                        prefixIcon: Icon(Iconsax.code)),
                  )),
                ],
              ),
              SizedBox(height: SizesLW.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "City", prefixIcon: Icon(Iconsax.building)),
                  )),
                  SizedBox(width: SizesLW.spaceBtwInputFields / 2),
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "State", prefixIcon: Icon(Iconsax.activity)),
                  )),
                ],
              ),
              SizedBox(height: SizesLW.spaceBtwInputFields),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Country,", prefixIcon: Icon(Iconsax.global))),
              SizedBox(height: SizesLW.defaultSpaces),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text("Save")))
            ],
          )),
        ),
      ),
    );
  }
}
