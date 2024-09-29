import 'package:get/get.dart';
import 'package:sub_tracker/service/data/category_service.dart';
import 'add_edit_subscription_controller.dart';

class AddEditSubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryService());
    Get.put(AddEditSubscriptionController());
  }
}
