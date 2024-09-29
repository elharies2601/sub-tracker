import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sub_tracker/theme/ThemeController.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStorage>(() => GetStorage());
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}