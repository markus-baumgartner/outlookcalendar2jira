# Outlook Calendar to Jira

This project provides a SwiftUI-based macOS application that reads calendar events and logs work to Jira. The application fetches events from the macOS Calendar using EventKit instead of Outlook. When launched, it now displays today's meetings in a table.

## Building

Use Swift Package Manager with macOS 13 or later. Some components rely on frameworks unavailable on Linux, so builds must run on macOS.

## Local Jira for testing

A simple `docker-compose.yml` is included for running Jira locally. Start the
container with:

```bash
docker compose up -d
```

The container exposes Jira on `http://localhost:8080` with default credentials
`admin`/`admin`. The application is preconfigured to use these credentials.
