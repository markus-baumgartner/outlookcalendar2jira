import Foundation
import Combine

final class Settings: ObservableObject {
    @Published var jiraURL: String = "http://localhost:8080"
    @Published var jiraUser: String = "admin"
    @Published var jiraPassword: String = "admin"
}
