class ReminderModel {
    var calendarId: Int64?
    //事件的标题。类型为String。
    var title: String
    //事件的开始时间，以毫秒为单位的时间戳。类型为Long。
    var startTime: Int64
    //事件的结束时间，以毫秒为单位的时间戳。类型为Long。
    var endTime: Int64
    //事件的描述。类型为String。
    var description: String?
    //事件的地点。类型为String。
    var location: String?
    //事件的持续时间，以毫秒为单位的时间间隔。如果使用了[DTEND]，则此参数将被忽略。类型为String。
    var duration: String?
    //事件的时区。类型为String。
    var timezone: String?
    //指示事件是否有提醒（闹钟）。值为0表示没有提醒，值为1表示有提醒。类型为Integer。
    var needReminder: Int?
    //指示事件是否是全天事件。值为0表示非全天事件，值为1表示全天事件。类型为Integer。
    var isFullDay: Int?
    //事件的重复规则。可以使用规定的格式指定事件的重复方式。类型为String。
    var repeatRule: String?
    //事件的组织者。类型为String。
    var organizer: String?
    //指示嘉宾是否可以修改事件。值为0表示嘉宾不能修改，值为1表示嘉宾可以修改。类型为Integer。
    var guestsCanModify: Int?
    
    init(
        calendarId: Int64?,
        title: String,
        startTime: Int64,
        endTime: Int64,
        description: String?,
        location: String?,
        duration: String?,
        timezone: String?,
        needReminder: Int?,
        isFullDay: Int?,
        repeatRule: String?,
        organizer: String?,
        guestsCanModify: Int?
    ) {
        self.calendarId = calendarId
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.description = description
        self.location = location
        self.duration = duration
        self.timezone = timezone
        self.needReminder = needReminder
        self.isFullDay = isFullDay
        self.repeatRule = repeatRule
        self.organizer = organizer
        self.guestsCanModify = guestsCanModify
    }
}
