import 'package:e_store_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store_app/common/widgets/image/circular_image.dart';
import 'package:e_store_app/common/widgets/products/cart/product_price_text.dart';
import 'package:e_store_app/common/widgets/texts/brandtitle_verifyicon.dart';
import 'package:e_store_app/common/widgets/texts/product_title.dart';
import 'package:e_store_app/features/shop/controllers/product_controller.dart';
import 'package:e_store_app/features/shop/models/product_model.dart';
import 'package:e_store_app/utils/contants/colors.dart';
import 'package:e_store_app/utils/contants/enums.dart';
import 'package:e_store_app/utils/contants/sizeslw.dart';
import 'package:flutter/material.dart';

class ProductMetadata extends StatelessWidget {
  final ProductModel product;
  final bool isDark;
  const ProductMetadata(
      {super.key, required this.product, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calSalePercentage(product.price, product.salePrice);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircularContainer(
              radius: SizesLW.sm,
              backgroundColor: EStoreColors.secondary.withValues(alpha: 0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: SizesLW.sm, vertical: SizesLW.xs),
              child: Text("$salePercentage%",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: EStoreColors.black)),
            ),
            SizedBox(width: SizesLW.spaceBtwItems),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text("\$${product.price}%",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              SizedBox(width: SizesLW.spaceBtwItems),
            ProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        SizedBox(width: SizesLW.spaceBtwItems / 1.5),
        ProductTitle(title: product.title),
        SizedBox(width: SizesLW.spaceBtwItems / 1.5),

        ///  Stock Status
        Row(
          children: [
            ProductTitle(title: "Status"),
            SizedBox(width: SizesLW.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(width: SizesLW.spaceBtwItems / 1.5),
        Row(
          children: [
            CircularImage(
                isNetworkImage: true,
                image: product.brand != null ? product.brand!.image : "",
                width: 32,
                height: 32,
                overLayColor: isDark ? EStoreColors.white : EStoreColors.black),
            SizedBox(width: SizesLW.spaceBtwItems / 2),
            BrandtitleVerifyicon(
                title: product.brand != null ? product.brand!.name : "",
                brandTextSize: TextSizes.medium)
          ],
        ),
      ],
    );
  }
}
