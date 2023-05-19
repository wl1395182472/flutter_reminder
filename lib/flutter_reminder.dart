// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'flutter_reminder_platform_interface.dart';

class FlutterReminder {
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
    return FlutterReminderPlatform.instance.addReminder(
      calendarId: calendarId,
      title: title,
      startTime: startTime,
      endTime: endTime,
      description: description,
      location: location,
      duration: duration,
      timezone: timezone,
      needReminder: needReminder,
      isFullDay: isFullDay,
      repeatRule: repeatRule,
      organizer: organizer,
      guestsCanModify: guestsCanModify,
    );
  }
}
