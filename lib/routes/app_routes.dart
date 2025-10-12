import 'package:e_store_app/features/authentication/screens/login/login_screen.dart';
import 'package:e_store_app/features/authentication/screens/onboarding.dart';
import 'package:e_store_app/features/authentication/screens/password_config/forget_password.dart';
import 'package:e_store_app/features/authentication/screens/signup/signup_screen.dart';
import 'package:e_store_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_store_app/features/persionalization/screens/address/addresses.dart';
import 'package:e_store_app/features/persionalization/screens/profile/profile_screen.dart';
import 'package:e_store_app/features/persionalization/screens/settings/setting_screen.dart';
import 'package:e_store_app/features/shop/screens/cart/cart_screen.dart';
import 'package:e_store_app/features/shop/screens/checkout/checkout.dart';
import 'package:e_store_app/features/shop/screens/home/home_screen.dart';
import 'package:e_store_app/features/shop/screens/orders/order_screen.dart';
import 'package:e_store_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_store_app/features/shop/screens/store/store_screen.dart';
import 'package:e_store_app/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: CustomRoutes.home, page: () => HomeScreen()),
    GetPage(name: CustomRoutes.store, page: () => StoreScreen()),
    GetPage(name: CustomRoutes.favorite, page: () => HomeScreen()),
    GetPage(name: CustomRoutes.settings, page: () => SettingScreen()),
    GetPage(name: CustomRoutes.productReview, page: () => ProductReviews()),
    GetPage(name: CustomRoutes.order, page: () => OrderScreen()),
    GetPage(name: CustomRoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: CustomRoutes.cart, page: () => CartScreen()),
    GetPage(name: CustomRoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: CustomRoutes.userAddress, page: () => Addresses()),
    GetPage(name: CustomRoutes.signup, page: () => SignupScreen()),
    GetPage(name: CustomRoutes.verifyEmail, page: () => VerifyEmailScreen()),
    GetPage(name: CustomRoutes.signin, page: () => LoginScreen()),
    GetPage(name: CustomRoutes.forgetPassword, page: () => ForgetPassword()),
    GetPage(name: CustomRoutes.onBoarding, page: () => OnboardingScreen()),
  ];
}
