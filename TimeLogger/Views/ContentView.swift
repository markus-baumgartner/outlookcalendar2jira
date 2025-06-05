import SwiftUI

struct ContentView: View {
    @StateObject private var vm = EventListVM()

    var body: some View {
        Table(vm.rows) {
            TableColumn("Start") { event in
                Text(event.start.formatted(date: .numeric, time: .shortened))
            }
            TableColumn("End") { event in
                Text(event.end.formatted(date: .numeric, time: .shortened))
            }
            TableColumn("Subject", value: \.subject)
        }
        .frame(minWidth: 800, minHeight: 400)
        .task {
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: Date())
            let end = calendar.date(byAdding: .day, value: 1, to: start)!
            await vm.refresh(start: start, end: end)
        }
    }
}
