#if canImport(EventKit)
import Foundation
import EventKit

actor MacCalendarService {
    nonisolated(unsafe) let store = EKEventStore()

    func fetchEvents(start: Date, end: Date) async throws -> [OutlookEvent] {
        try await store.requestAccess(to: .event)
        let predicate = store.predicateForEvents(withStart: start, end: end, calendars: nil)
        let events = store.events(matching: predicate)
        return events.map { event in
            OutlookEvent(
                id: event.eventIdentifier,
                subject: event.title ?? "",
                bodyPreview: event.notes,
                start: event.startDate,
                end: event.endDate,
                overrideIssueKey: nil,
                detectedIssueKey: event.title?.firstJiraIssue()
            )
        }
    }
}
#else
import Foundation

actor MacCalendarService {
    func fetchEvents(start: Date, end: Date) async throws -> [OutlookEvent] {
        return []
    }
}
#endif
