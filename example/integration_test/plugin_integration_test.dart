// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_reminder/flutter_reminder.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('addReminder test', (WidgetTester tester) async {
    final FlutterReminder plugin = FlutterReminder();
    final bool version = await plugin.addReminder(
      title: 'test for addReminder',
      startTime:
          DateTime.now().add(const Duration(minutes: 1)).millisecondsSinceEpoch,
      endTime:
          DateTime.now().add(const Duration(minutes: 2)).millisecondsSinceEpoch,
    );
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(version, true);
  });
}
