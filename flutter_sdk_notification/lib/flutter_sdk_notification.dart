
import 'flutter_sdk_notification_platform_interface.dart';

class FlutterSdkNotification {
  static Future<void> showHome() {
    return FlutterSdkNotificationPlatform.instance.showHome();
  }

  static Future<void> showNotification(Map<String, dynamic> body, String notificationIcon) {
    return FlutterSdkNotificationPlatform.instance.showNotification(body, notificationIcon);
  }

  static Future<void> handleNotification(Map<String, dynamic> data) async {
    await FlutterSdkNotificationPlatform.instance.handleNotification(data);
  }
}
