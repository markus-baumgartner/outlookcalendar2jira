import Foundation

actor JiraService {
    func log(worklog: JiraWorklog, to issueKey: String, settings: Settings) async throws {
        guard let url = URL(string: "\(settings.jiraURL)/rest/api/2/issue/\(issueKey)/worklog") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let authString = "\(settings.jiraUser):\(settings.jiraPassword)".data(using: .utf8)!.base64EncodedString()
        request.addValue("Basic \(authString)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(worklog)

        _ = try await URLSession.shared.data(for: request)
    }
}
