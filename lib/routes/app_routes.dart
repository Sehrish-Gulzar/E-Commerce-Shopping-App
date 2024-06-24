import 'package:e_commerce_shopping_app/routes/routes.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_passwrod.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_reviews/profuct_reviews.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: SgRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: SgRoutes.store,
      page: () => const StoreScreen(),
    ),
    GetPage(
      name: SgRoutes.favourites,
      page: () => const FavouriteScreen(),
    ),
    GetPage(
      name: SgRoutes.settings,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: SgRoutes.productReviews,
      page: () => const ProductReviewsScreen(),
    ),
    GetPage(
      name: SgRoutes.order,
      page: () => const OrdersScreen(),
    ),
    GetPage(
      name: SgRoutes.checkout,
      page: () => const CheckoutScreen(),
    ),
    GetPage(
      name: SgRoutes.cart,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: SgRoutes.userProfile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: SgRoutes.userAddress,
      page: () => const UserAddressScreen(),
    ),
    GetPage(
      name: SgRoutes.signup,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: SgRoutes.verifyEmail,
      page: () => const VerifyEmailScreen(),
    ),
    GetPage(
      name: SgRoutes.signIn,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: SgRoutes.forgetPassword,
      page: () => const ForgetPassScreen(),
    ),
    GetPage(
      name: SgRoutes.onBoarding,
      page: () => const OnBoardingScreen(),
    ),
    // add more as needed
  ];
}
