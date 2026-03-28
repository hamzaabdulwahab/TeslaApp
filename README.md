# TeslaApp

TeslaApp is a SwiftUI concept app that recreates a Tesla-style control experience on iOS. It focuses on clean UI, modular view composition, and interactive bottom sheets for key actions like charging, media, and voice command flows.

This project is currently UI-first (no live Tesla API integration yet), and is a solid base for plugging in real vehicle data later.

## What This App Includes

- Home dashboard with vehicle identity, battery summary, shortcuts, and settings groups
- Car controls screen for lock actions, lights, horn, trunk controls, and valet mode toggle
- Location screen built with MapKit and a custom map annotation
- Slide-up action surfaces for:
  - voice command prompt
  - charging status
  - media player UI
  - action confirmation toast
- Reusable SwiftUI components for buttons, cards, and dividers
- Asset catalog with custom app colors and branding images

## Screens and Flow

- `TeslaApp/TeslaAppApp.swift`
  - App entry point that launches `ContentView`
- `TeslaApp/ContentView.swift`
  - Main dashboard and modal/bottom-sheet orchestration
- `TeslaApp/CarControlsView.swift`
  - Controls-focused detail view
- `TeslaApp/LocationView.swift`
  - Map and summon panel
- `TeslaApp/ActionComponents.swift`
  - Voice, charging, media, and action notification components
- `TeslaApp/CommonComponents.swift`
  - Shared UI primitives (`GeneralButton`, `ActionButton`, `FullButton`, etc.)

## Tech Stack

- Swift
- SwiftUI
- MapKit
- XCTest + Swift Testing (default template tests)

## Project Structure

```text
TeslaApp/
├── TeslaApp/
│   ├── TeslaAppApp.swift
│   ├── ContentView.swift
│   ├── CarControlsView.swift
│   ├── LocationView.swift
│   ├── ActionComponents.swift
│   ├── CommonComponents.swift
│   └── Assets.xcassets/
├── TeslaAppTests/
├── TeslaAppUITests/
└── TeslaApp.xcodeproj/
```

## Running Locally

### Requirements

- macOS with Xcode installed
- iOS Simulator (or physical iOS device)

### Run

```bash
open TeslaApp.xcodeproj
```

Then in Xcode:

1. Select the `TeslaApp` scheme.
2. Choose an iOS simulator target.
3. Press Run.

## Tests

The repository includes default starter tests:

- `TeslaAppTests/TeslaAppTests.swift` (Swift Testing scaffold)
- `TeslaAppUITests/TeslaAppUITests.swift` and `TeslaAppUITests/TeslaAppUITestsLaunchTests.swift` (XCTest UI scaffolds)

You can run tests from Xcode using Product > Test.

## Current Status

What is implemented now:

- Strong UI foundation and navigation for a Tesla-like control app
- Reusable component system and coherent visual style
- Mocked/static state for demo interactions

What is not implemented yet:

- Tesla account auth and backend integration
- Real-time telemetry and command execution
- Persistent storage and production-grade state management

## Design Notes

- Visual style uses a dark theme with accent colors from `Assets.xcassets/Colors`
- Most interactions are intentionally animation-driven to mimic an in-car control feel
- Views are split by user intent (home, controls, location, action overlays) to keep iteration simple

## Roadmap (Practical Next Steps)

- Add a lightweight domain layer (`VehicleState`, `CommandService`) between UI and data
- Replace hardcoded values with local mock models and preview fixtures
- Add snapshot/UI assertion tests for key user paths
- Introduce networking and secure token handling once API integration starts

## Author

Built by Hamza Wahab (2026).

If you are using this as a portfolio project, this README reflects the project as it exists today without overselling scope.
