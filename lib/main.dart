import 'package:e_qurban/app/data/models/notification_service.dart';
import 'package:e_qurban/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize notification service
  final notificationService = NotificationService();
  notificationService.setupNotifications(); // Await only if it's a Future

  // Run the application
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Qurban Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
