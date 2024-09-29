import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sub_tracker/screen/home/home_controller.dart';
import 'package:sub_tracker/service/data/subscription_service.dart';
import 'package:sub_tracker/theme/ThemeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SubscriptionService());
    Get.put(HomeController());
    Get.put(GetStorage());
  }
}
