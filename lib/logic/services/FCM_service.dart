import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:order_tracking_notification/logic/services/local_notification_service.dart';

class FcmService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static Future<void> init() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    await firebaseMessaging.getToken().then(
      (value) => sendTokenToServer(value!),
    );

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    handleForegroundMessage();
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log(message.notification?.title ?? "null");
      LocalNotificationService.showBasicNotification(message);
    });
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? "null");
  }

  static void sendTokenToServer(String token) {}
}
