import Foundation
import SwiftUI

@MainActor
final class EventListVM: ObservableObject {
    @Published var rows: [OutlookEvent] = []
    private let outlookService = OutlookService()

    func refresh(start: Date, end: Date) async {
        do {
            rows = try await outlookService.fetchEvents(start: start, end: end)
        } catch {
            // TODO: handle error
        }
    }
}
