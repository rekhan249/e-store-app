import 'package:e_store_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_store_app/features/shop/screens/orders/widgets/custom_order_list.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: CustomAppbar(
          title: Text("My Orders",
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: Padding(
        padding: EdgeInsets.all(SizesLW.defaultSpaces),
        child: CustomOrderList(),
      ),
    );
  }
}
