// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "outlookcalendar2jira",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "outlookcalendar2jira", targets: ["outlookcalendar2jira"])
    ],
    targets: [
        .executableTarget(
            name: "outlookcalendar2jira",
            path: "TimeLogger"
        ),
        .testTarget(
            name: "TimeLoggerTests",
            dependencies: ["outlookcalendar2jira"],
            path: "Tests/TimeLoggerTests"
        )
    ]
)
