import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void setupNotifications() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message while in the foreground!');
      if (message.notification != null) {
        Get.snackbar(
          message.notification!.title ?? '',
          message.notification!.body ?? '',
          snackPosition: SnackPosition.TOP,
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new message was opened: ${message.messageId}');

    });

    String? token = await _firebaseMessaging.getToken();
    print("FCM Token: $token");
  }
}
