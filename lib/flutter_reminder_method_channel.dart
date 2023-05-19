import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_reminder_platform_interface.dart';

/// An implementation of [FlutterReminderPlatform] that uses method channels.
class MethodChannelFlutterReminder extends FlutterReminderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_reminder');

  @override
  Future<bool> addReminder() async {
    bool result = false;
    result = (await methodChannel.invokeMethod<bool>('addReminder')) ?? false;
    return result;
  }
}
