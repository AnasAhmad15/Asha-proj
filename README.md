# ASHA EHR Companion

A frontend-only prototype app for SIH 2025, designed to support ASHA workers, PHC staff, and supervisors in managing community health records.

## Features

### Onboarding Flow
1. **Splash Screen** - Displays app logo and name with smooth animation
2. **Language Selection** - Choose from English, Hindi, or Marathi
3. **Role Selection** - Select user role (ASHA Worker, PHC Staff, or Supervisor)

### Dashboards
- **ASHA Worker Dashboard** - Patient registration, visit recording, maternal care, child health tracking
- **PHC Staff Dashboard** - Patient records, appointments, inventory management, analytics
- **Supervisor Dashboard** - Team management, performance monitoring, task assignment, area monitoring

## Design Principles

- **Accessibility First** - Large buttons, clear fonts, and high contrast for semi-literate users
- **Modern UI** - Soft colors (blue, green, teal), rounded corners, smooth animations
- **Multilingual** - Support for English, Hindi, and Marathi
- **Modular Structure** - Clean separation of concerns with organized file structure

## Project Structure

```
lib/
├── main.dart                          # App entry point
├── theme/
│   └── app_theme.dart                 # Global theme configuration
└── screens/
    ├── splash_screen.dart             # Initial splash screen
    ├── language_selection_screen.dart # Language selection
    ├── role_selection_screen.dart     # Role selection
    └── dashboards/
        ├── asha_dashboard.dart        # ASHA worker dashboard
        ├── phc_dashboard.dart         # PHC staff dashboard
        └── supervisor_dashboard.dart  # Supervisor dashboard
```

## Getting Started

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK

### Running the App

```bash
# Get dependencies
flutter pub get

# Run the app
flutter run
```

## Color Palette

- **Primary Blue**: `#4A90E2` - Main actions and headers
- **Secondary Green**: `#7ED321` - Success states and PHC theme
- **Accent Teal**: `#50E3C2` - Highlights and supervisor theme
- **Background**: `#FAFAFA` - Clean, light background
- **Text Dark**: `#2C3E50` - Primary text
- **Text Light**: `#7F8C8D` - Secondary text

## Future Enhancements

- Backend integration for data persistence
- Offline mode with local storage
- Real-time notifications
- GPS tracking for field visits
- Photo capture for documentation
- Digital signatures
- Report generation and export
