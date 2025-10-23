import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_sdk_notification_method_channel.dart';

abstract class FlutterSdkNotificationPlatform extends PlatformInterface {
  /// Constructs a FlutterSdkNotificationPlatform.
  FlutterSdkNotificationPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSdkNotificationPlatform _instance = MethodChannelFlutterSdkNotification();

  /// The default instance of [FlutterSdkNotificationPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSdkNotification].
  static FlutterSdkNotificationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SdkSamplePluginPlatform] when
  /// they register themselves.
  static set instance(FlutterSdkNotificationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> showHome() {
    throw UnimplementedError('showHome() has not been implemented.');
  }

  Future<void> showNotification(
    Map<String, dynamic> body,
    String notificationIcon,
  );

  Future<void> handleNotification(Map<String, dynamic> data) {
    throw UnimplementedError('handleNotification() has not been implemented.');
  }
}
