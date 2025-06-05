import Foundation

struct JiraWorklog: Encodable {
    let started: String
    let timeSpentSeconds: Int
    let comment: String
}
