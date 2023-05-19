import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_reminder/flutter_reminder.dart';
import 'package:flutter_reminder/flutter_reminder_platform_interface.dart';
import 'package:flutter_reminder/flutter_reminder_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterReminderPlatform
    with MockPlatformInterfaceMixin
    implements FlutterReminderPlatform {
  @override
  Future<bool> addReminder() => Future.value(false);
}

void main() {
  final FlutterReminderPlatform initialPlatform =
      FlutterReminderPlatform.instance;

  test('$MethodChannelFlutterReminder is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterReminder>());
  });

  test('addReminder', () async {
    FlutterReminder flutterReminderPlugin = FlutterReminder();
    MockFlutterReminderPlatform fakePlatform = MockFlutterReminderPlatform();
    FlutterReminderPlatform.instance = fakePlatform;

    expect(await flutterReminderPlugin.addReminder(), false);
  });
}
