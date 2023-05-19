import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_reminder/flutter_reminder_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterReminder platform = MethodChannelFlutterReminder();
  const MethodChannel channel = MethodChannel('flutter_reminder');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test(
    'addReminder',
    () async {
      expect(
        await platform.addReminder(
          title: 'test for addReminder',
          startTime: DateTime.now()
              .add(const Duration(minutes: 1))
              .millisecondsSinceEpoch,
          endTime: DateTime.now()
              .add(const Duration(minutes: 2))
              .millisecondsSinceEpoch,
        ),
        false,
      );
    },
  );
}
