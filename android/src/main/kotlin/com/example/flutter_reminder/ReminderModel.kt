package com.example.flutter_reminder

class ReminderModel(
    //事件所属的日历ID，可以通过查询日历来获取。类型为Long。
        var calendarId: Long?,
    //事件的标题。类型为String。
        val title: String,
    //事件的开始时间，以毫秒为单位的时间戳。类型为Long。
        val startTime: Long,
    //事件的结束时间，以毫秒为单位的时间戳。类型为Long。
        val endTime: Long,
    //事件的描述。类型为String。
        val description: String?,
    //事件的地点。类型为String。
        val location: String?,
    //事件的持续时间，以毫秒为单位的时间间隔。如果使用了[DTEND]，则此参数将被忽略。类型为String。
        val duration: String?,
    //事件的时区。类型为String。
        val timezone: String?,
    //指示事件是否有提醒（闹钟）。值为0表示没有提醒，值为1表示有提醒。类型为Integer。
        val needReminder: Int?,
    //指示事件是否是全天事件。值为0表示非全天事件，值为1表示全天事件。类型为Integer。
        val isFullDay: Int?,
    //事件的重复规则。可以使用规定的格式指定事件的重复方式。类型为String。
        val repeatRule: String?,
    //事件的组织者。类型为String。
        val organizer: String?,
    //指示嘉宾是否可以修改事件。值为0表示嘉宾不能修改，值为1表示嘉宾可以修改。类型为Integer。
        val guestsCanModify: Int?,
        )