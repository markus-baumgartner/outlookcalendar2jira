import Foundation
import Combine

final class Settings: ObservableObject {
    @Published var jiraURL: String = ""
    @Published var jiraUser: String = ""
    @Published var jiraPassword: String = ""
}
