import Foundation
import SwiftUI

@MainActor
final class EventListVM: ObservableObject {
    @Published var rows: [OutlookEvent] = []
    private let calendarService = MacCalendarService()

    func refresh(start: Date, end: Date) async {
        do {
            rows = try await calendarService.fetchEvents(start: start, end: end)
        } catch {
            // TODO: handle error
        }
    }
}
