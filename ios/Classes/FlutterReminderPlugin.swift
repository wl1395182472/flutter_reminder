import Flutter
import UIKit

public class FlutterReminderPlugin: NSObject, FlutterPlugin {
    let reminderManager = ReminderManager()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_reminder", binaryMessenger: registrar.messenger())
        let instance = FlutterReminderPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "addReminder":
            reminderManager.addReminder(
                reminderModel:ReminderModel(),
            ) { success in
                if success {
                    result(true)
                } else {
                    result(false)
                }
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
