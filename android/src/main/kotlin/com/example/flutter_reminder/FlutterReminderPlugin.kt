package com.example.flutter_reminder


import android.content.Context

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterReminderPlugin */
class FlutterReminderPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var reminderManager: ReminderManager

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_reminder")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
        reminderManager = ReminderManager(context)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "addReminder") {
            val calendarId = call.argument<Long?>("calendarId")
            val title = call.argument<String>("title") ?: ""
            val startTime = call.argument<Long>("startTime") ?: 0
            val endTime = call.argument<Long>("endTime") ?: 0
            val description = call.argument<String?>("description")
            val location = call.argument<String?>("location")
            val duration = call.argument<String?>("duration")
            val timezone = call.argument<String?>("timezone")
            val needReminder = call.argument<Int?>("needReminder")
            val isFullDay = call.argument<Int?>("isFullDay")
            val repeatRule = call.argument<String?>("repeatRule")
            val organizer = call.argument<String?>("organizer")
            val guestsCanModify = call.argument<Int?>("guestsCanModify")
            reminderManager.addReminder(
                ReminderModel(
                    calendarId,
                    title,
                    startTime,
                    endTime,
                    description,
                    location,
                    duration,
                    timezone,
                    needReminder,
                    isFullDay,
                    repeatRule,
                    organizer,
                    guestsCanModify,
                ),
                object : ReminderManager.ReminderListener {
                    override fun onReminderAdded(success: Boolean) {
                        if (success) {
                            result.success(true)
                        } else {
                            result.error(
                                "",
                                "无法添加提醒事项。",
                                "",
                            )
                        }
                    }
                },
            )
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }


}
