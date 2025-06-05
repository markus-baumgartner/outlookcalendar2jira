import Foundation
import SwiftUI

@MainActor
final class EventListVM: ObservableObject {
    @Published var rows: [OutlookEvent] = []
    private let calendarService = MacCalendarService()
    private let jira = JiraService()
    let settings = Settings()

    func refresh(start: Date, end: Date) async {
        do {
            rows = try await calendarService.fetchEvents(start: start, end: end)
        } catch {
            // TODO: handle error
        }
    }

    func logAll() async {
        for index in rows.indices {
            guard !rows[index].logged else { continue }
            let key = rows[index].issueKey
            guard !key.isEmpty else { continue }
            let worklog = JiraWorklog(
                started: ISO8601DateFormatter().string(from: rows[index].start),
                timeSpentSeconds: Int(rows[index].duration),
                comment: rows[index].subject
            )
            do {
                let config = settings.config
                try await jira.log(worklog: worklog, to: key, config: config)
                rows[index].logged = true
            } catch {
                // TODO: handle error
            }
        }
    }
}
