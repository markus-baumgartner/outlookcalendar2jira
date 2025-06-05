import SwiftUI

struct ContentView: View {
    @StateObject private var vm = EventListVM()

    var body: some View {
        Text("Hello World")
            .frame(minWidth: 800, minHeight: 400)
            .task {
                let today = Date()
                await vm.refresh(start: today, end: today)
            }
    }
}
