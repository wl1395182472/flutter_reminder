package com.example.flutter_reminder

import android.Manifest
import android.app.Activity
import android.content.ContentResolver
import android.content.ContentUris
import android.content.ContentValues
import android.content.Context
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.provider.CalendarContract
import android.util.Log
import androidx.core.app.ActivityCompat
import java.util.*

class ReminderManager(private val context: Context) {

    companion object {
        private const val PERMISSION_REQUEST_CODE = 1
    }

    interface ReminderListener {
        fun onReminderAdded(success: Boolean)
    }

    fun addReminder(ReminderModel: ReminderModel, listener: ReminderListener) {
        if (hasCalendarPermission()) {
            val success = createReminder(
                ReminderModel
            )
            listener.onReminderAdded(success)
        } else {
            requestCalendarPermission()
            listener.onReminderAdded(false)
        }
    }


    private fun hasCalendarPermission(): Boolean {
        val permission = Manifest.permission.WRITE_CALENDAR
        val result = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            context.checkSelfPermission(permission)
        } else {
            Log.e("flutter_reminder", "版本低于Android 6.0")
            return false
        }
        return result == PackageManager.PERMISSION_GRANTED
    }

    private fun requestCalendarPermission() {
        val permission = Manifest.permission.WRITE_CALENDAR
        ActivityCompat.requestPermissions(
            context as Activity,
            arrayOf(permission),
            PERMISSION_REQUEST_CODE
        )
    }

    private fun createReminder(reminderModel: ReminderModel): Boolean {
        val contentResolver: ContentResolver = context.contentResolver
        val values = ContentValues().apply {
            put(CalendarContract.Events.CALENDAR_ID, reminderModel.calendarId ?: 1)
            put(CalendarContract.Events.TITLE, reminderModel.title)
            put(CalendarContract.Events.DTSTART, reminderModel.startTime)
            put(CalendarContract.Events.DTEND, reminderModel.endTime)
            put(CalendarContract.Events.DESCRIPTION, reminderModel.description)
            put(CalendarContract.Events.EVENT_LOCATION, reminderModel.location)
            put(CalendarContract.Events.DURATION, reminderModel.duration)
            put(
                CalendarContract.Events.EVENT_TIMEZONE,
                reminderModel.timezone ?: TimeZone.getDefault().id
            )
            put(CalendarContract.Events.HAS_ALARM, reminderModel.needReminder ?: 1)
            put(CalendarContract.Events.ALL_DAY, reminderModel.isFullDay)
            put(CalendarContract.Events.RRULE, reminderModel.repeatRule)
            put(CalendarContract.Events.ORGANIZER, reminderModel.organizer)
            put(CalendarContract.Events.GUESTS_CAN_MODIFY, reminderModel.guestsCanModify)
        }

        val uri: Uri? = contentResolver.insert(CalendarContract.Events.CONTENT_URI, values)
        uri?.let {
            val eventID: Long = ContentUris.parseId(it)

            val reminderValues = ContentValues().apply {
                put(CalendarContract.Reminders.EVENT_ID, eventID)
                put(CalendarContract.Reminders.METHOD, CalendarContract.Reminders.METHOD_ALERT)
                put(CalendarContract.Reminders.MINUTES, 15) // 提前15分钟提醒
            }

            val reminderUri =
                contentResolver.insert(CalendarContract.Reminders.CONTENT_URI, reminderValues)

            // 返回添加提醒事项的结果
            return reminderUri != null
        }

        return false
    }
}
