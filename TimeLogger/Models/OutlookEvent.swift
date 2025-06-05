import Foundation

struct OutlookEvent: Identifiable, Decodable {
    let id: String
    let subject: String
    let bodyPreview: String?
    let start: Date
    let end: Date
    var overrideIssueKey: String?
    var detectedIssueKey: String?
    var logged: Bool = false

    var issueKey: String {
        get { overrideIssueKey ?? detectedIssueKey ?? "" }
        set { overrideIssueKey = newValue }
    }

    var duration: TimeInterval {
        end.timeIntervalSince(start)
    }
}
