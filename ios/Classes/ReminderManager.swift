import EventKit

class ReminderManager {
    let eventStore = EKEventStore()
    
    typealias ReminderCompletionHandler = (Bool) -> Void
    
    func addReminder(
        reminderModel: ReminderModel,
        completion: @escaping ReminderCompletionHandler
    ) {
        eventStore.requestAccess(to: .event) { (granted, error) in
            if granted && error == nil {
                let event = EKEvent(eventStore: self.eventStore)
                event.calendar = self.eventStore.defaultCalendarForNewEvents
                event.title =  reminderModel.title
                event.startDate = Date(timeIntervalSince1970: TimeInterval(reminderModel.startTime))
                event.endDate = Date(timeIntervalSince1970: TimeInterval(reminderModel.endTime))
                event.description = reminderModel.description
                event.location = reminderModel.location
                event.notes = reminderModel.location
                event.isAllDay = reminderModel.isFullDay
                event.isDetached = true
                
                do {
                    try self.eventStore.save(event, span: .thisEvent)
                    completion(true)
                } catch {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }
    }
}
