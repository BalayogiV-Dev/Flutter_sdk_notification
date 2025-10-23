import 'dart:io';

import 'package:flutter_sdk_notification/flutter_sdk_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sdk_notification_sample/firebase_options.dart';
import 'package:flutter_sdk_notification_sample/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize firebase services
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    sound: true,
    alert: true,
    badge: true,
  );
  // Request Notification permission when user enter into application
  await FirebaseMessaging.instance.requestPermission();
  // Initialize Firebase Messaging services to receive Notifications
  NotificationService.firebaseMessagingInitialize();
  // Get FCM Token Based
  await NotificationService.getFCMToken();

  // Handle notification when app is terminated state (iOS only)
  if (Platform.isIOS) {
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        FlutterSdkNotification.handleNotification(message.data);
      }
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                FlutterSdkNotification.showHome();
              },
              child: Text("Show Home"),
            ),
          ],
        ),
      ),
    );
  }
}
