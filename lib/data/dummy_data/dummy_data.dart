import 'package:e_store_app/features/shop/models/banner_model.dart';
import 'package:e_store_app/features/shop/models/category_model.dart';
import 'package:e_store_app/routes/routes.dart';
import 'package:e_store_app/utils/contants/image_strings.dart';

class DummyData {
  /// Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: ImageStrings.promoBan1,
        targetScreen: CustomRoutes.order,
        active: false),
    BannerModel(
        imageUrl: ImageStrings.promoBan2,
        targetScreen: CustomRoutes.cart,
        active: false),
    BannerModel(
        imageUrl: ImageStrings.promoBan3,
        targetScreen: CustomRoutes.favorite,
        active: false),
    BannerModel(
        imageUrl: ImageStrings.promoBan1,
        targetScreen: CustomRoutes.search,
        active: false),
    BannerModel(
        imageUrl: ImageStrings.promoBan2,
        targetScreen: CustomRoutes.settings,
        active: false),
    BannerModel(
        imageUrl: ImageStrings.promoBan3,
        targetScreen: CustomRoutes.userAddress,
        active: false),
    BannerModel(
        imageUrl: ImageStrings.promoBan1,
        targetScreen: CustomRoutes.checkout,
        active: false)
  ];

  ///  Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1',
        name: "Sports",
        image: ImageStrings.sportIcon,
        isFeatured: true),
    CategoryModel(
        id: '5',
        name: "Furniture",
        image: ImageStrings.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: "Electronic",
        image: ImageStrings.electronicIcon,
        isFeatured: true),
    CategoryModel(
        id: '3',
        name: "Clothes",
        image: ImageStrings.clotheIcon,
        isFeatured: true),
    CategoryModel(
        id: '4',
        name: "Animal",
        image: ImageStrings.animalIcon,
        isFeatured: true),
    CategoryModel(
        id: '6',
        name: "Shoes",
        image: ImageStrings.shoesIcon,
        isFeatured: true),
    CategoryModel(
        id: '7',
        name: "Cosmetic",
        image: ImageStrings.cosmeticIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: "Jewelery",
        image: ImageStrings.jewelryIcon,
        isFeatured: true),

    /// Sub Categories for sports
    CategoryModel(
        id: "8",
        name: "Sport Shoes",
        image: ImageStrings.sportIcon,
        parentId: "1",
        isFeatured: false),
    CategoryModel(
        id: "9",
        name: "Track Suits",
        image: ImageStrings.sportIcon,
        parentId: "1",
        isFeatured: false),
    CategoryModel(
        id: "10",
        name: "Sport Equipments",
        image: ImageStrings.sportIcon,
        parentId: "1",
        isFeatured: false),

    /// Sub Categories for furnitures
    CategoryModel(
        id: "11",
        name: "Bedroom furniture",
        image: ImageStrings.furnitureIcon,
        parentId: "5",
        isFeatured: false),
    CategoryModel(
        id: "12",
        name: "Kitchen furniture",
        image: ImageStrings.furnitureIcon,
        parentId: "5",
        isFeatured: false),
    CategoryModel(
        id: "13",
        name: "Office furniture",
        image: ImageStrings.furnitureIcon,
        parentId: "5",
        isFeatured: false),

    /// Sub Categories for Electronice
    CategoryModel(
        id: "14",
        name: "Laptop",
        image: ImageStrings.electronicIcon,
        parentId: "2",
        isFeatured: false),
    CategoryModel(
        id: "15",
        name: "Mobile",
        image: ImageStrings.electronicIcon,
        parentId: "2",
        isFeatured: false),

    /// Sub Categories for Clothes
    CategoryModel(
        id: "16",
        name: "Shirts",
        image: ImageStrings.clotheIcon,
        parentId: "3",
        isFeatured: false),
  ];
}
