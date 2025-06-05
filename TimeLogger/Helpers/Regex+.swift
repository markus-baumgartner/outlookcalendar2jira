import Foundation

extension String {
    func firstJiraIssue() -> String? {
        let regex = try? NSRegularExpression(pattern: "[A-Z]+-\\d+")
        let range = NSRange(self.startIndex..<self.endIndex, in: self)
        let match = regex?.firstMatch(in: self, range: range)
        if let match = match, let r = Range(match.range, in: self) {
            return String(self[r])
        }
        return nil
    }
}
