import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_reminder_method_channel.dart';

abstract class FlutterReminderPlatform extends PlatformInterface {
  /// Constructs a FlutterReminderPlatform.
  FlutterReminderPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterReminderPlatform _instance = MethodChannelFlutterReminder();

  /// The default instance of [FlutterReminderPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterReminder].
  static FlutterReminderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterReminderPlatform] when
  /// they register themselves.
  static set instance(FlutterReminderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> addReminder({
    int? calendarId,
    required String title,
    required int startTime,
    required int endTime,
    String? description,
    String? location,
    String? duration,
    String? timezone,
    int? needReminder,
    int? isFullDay,
    String? repeatRule,
    String? organizer,
    int? guestsCanModify,
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
