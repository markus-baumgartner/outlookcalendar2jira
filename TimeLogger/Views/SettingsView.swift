import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings: Settings

    var body: some View {
        Form {
            TextField("Jira URL", text: $settings.jiraURL)
            TextField("Username", text: $settings.jiraUser)
            SecureField("Password", text: $settings.jiraPassword)
        }
        .padding()
    }
}
