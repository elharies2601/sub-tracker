import 'package:get/get.dart';
import 'package:sub_tracker/screen/detail/detail_subscription_controller.dart';
import 'package:sub_tracker/service/data/payment_service.dart';
import 'package:sub_tracker/service/data/subscription_service.dart';

class DetailSubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SubscriptionService());
    Get.put(PaymentService());
    Get.put(DetailSubscriptionController());
  }
}