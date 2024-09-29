import 'package:get/route_manager.dart';
import 'package:sub_tracker/screen/add_subscription/add_edit_subscription_binding.dart';
import 'package:sub_tracker/screen/add_subscription/add_edit_subscription_screen.dart';
import 'package:sub_tracker/screen/detail/detail_subscription_binding.dart';
import 'package:sub_tracker/screen/detail/detail_subscription_screen.dart';
import 'package:sub_tracker/screen/home/home_binding.dart';
import 'package:sub_tracker/screen/home/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ADD_EDIT_SUBSCRIPTION,
      page: () => AddEditSubscriptionScreen(),
      binding: AddEditSubscriptionBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_SUBSCRIPTION,
      page: () => DetailSubscriptionScreen(),
      binding: DetailSubscriptionBinding()
    ),
  ];
}
