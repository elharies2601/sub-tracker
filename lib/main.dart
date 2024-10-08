import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sub_tracker/routes/app_pages.dart';
import 'package:sub_tracker/service/ads/ads_service.dart';
import 'package:sub_tracker/service/data/category_service.dart';
import 'package:sub_tracker/service/data/payment_service.dart';
import 'package:sub_tracker/service/data/subscription_service.dart';
import 'package:sub_tracker/theme/ThemeController.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/theme/theme_binding.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => SubscriptionService().init());
  await Get.putAsync(() => CategoryService().init());
  await Get.putAsync(() => PaymentService().init());
  await Get.putAsync(() => AdsService().init());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await initializeDateFormatting('id_ID').then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return Obx(() {
      return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: ThemeBinding(),
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      );
    });
  }
}
