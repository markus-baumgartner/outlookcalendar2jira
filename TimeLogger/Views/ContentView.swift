import SwiftUI

struct ContentView: View {
    @StateObject private var vm = EventListVM()

    var body: some View {
        VStack {
            Table($vm.rows) { $event in
                TableColumn("Start") { row in
                    Text(row.start.formatted(date: .numeric, time: .shortened))
                }
                TableColumn("End") { row in
                    Text(row.end.formatted(date: .numeric, time: .shortened))
                }
                TableColumn("Duration") { row in
                    Text(row.duration.formatted())
                }
                TableColumn("Subject") { row in
                    Text(row.subject)
                }
                TableColumn("Jira Issue") { binding in
                    TextField("", text: Binding(
                        get: { binding.wrappedValue.issueKey },
                        set: { binding.wrappedValue.issueKey = $0 }
                    ))
                }
            }
            .frame(minWidth: 800, minHeight: 400)

            Button("Log All") {
                Task { await vm.logAll() }
            }
        }
        .task {
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: Date())
            let end = calendar.date(byAdding: .day, value: 1, to: start)!
            await vm.refresh(start: start, end: end)
        }
    }
}
