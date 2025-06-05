import Foundation

struct JiraConfig: Sendable {
    let url: String
    let user: String
    let password: String
}

extension Settings {
    var config: JiraConfig {
        JiraConfig(url: jiraURL, user: jiraUser, password: jiraPassword)
    }
}
