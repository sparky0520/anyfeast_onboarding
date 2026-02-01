# Quick Start Guide

Get the AnyFeast onboarding prototype running in under 5 minutes.

## ⚡ Fast Setup

### 1. Prerequisites Check
```bash
# Verify Flutter is installed
flutter --version

# Should show Flutter 3.0.0 or higher
```

Don't have Flutter? [Install it here](https://docs.flutter.dev/get-started/install)

### 2. Get the Code
```bash
# If you have the code, navigate to it
cd anyfeast_onboarding

# Or copy these files from the provided source
```

### 3. Install & Run
```bash
# Get dependencies (usually takes ~10 seconds)
flutter pub get

# Run on your preferred device
flutter run
```

That's it! The app should now be running.

## 🎯 Common Commands

### Run on Specific Device
```bash
# iOS Simulator
flutter run -d ios

# Android Emulator  
flutter run -d android

# Chrome (for quick testing, may have layout differences)
flutter run -d chrome

# See all devices
flutter devices
```

### Development Tips
```bash
# Hot reload (press 'r' in terminal while app is running)
r

# Hot restart (press 'R')
R

# Open DevTools
flutter pub global activate devtools
flutter pub global run devtools
```

## 📱 Testing on Real Device

### iOS (requires Mac)
1. Connect iPhone via USB
2. Open Xcode and add your Apple ID
3. Select your phone in Xcode devices
4. Run: `flutter run`

### Android
1. Enable Developer Options on your phone
2. Enable USB Debugging
3. Connect via USB
4. Run: `flutter run`
5. Select your device from the list

## 🐛 Troubleshooting

### "Flutter not found"
```bash
# Add Flutter to your PATH
export PATH="$PATH:`pwd`/flutter/bin"
```

### "No devices found"
```bash
# Check connected devices
flutter devices

# For iOS: Open Simulator.app
open -a Simulator

# For Android: Open Android Studio → AVD Manager
```

### "Gradle build failed" (Android)
```bash
# Clear cache
flutter clean
flutter pub get
```

### "Podfile issue" (iOS)
```bash
cd ios
pod install
cd ..
flutter run
```

### "Dependency version conflict"
```bash
flutter pub upgrade --major-versions
```

## 🎨 Customization Quick Reference

### Change Primary Color
`lib/main.dart` line 19:
```dart
primaryColor: const Color(0xFFE63946), // Change this hex code
```

### Modify Diet Options
`lib/screens/dietary_preferences_screen.dart` lines 28-49:
```dart
final List<Map<String, dynamic>> dietOptions = [
  // Add, remove, or modify options here
];
```

### Adjust Calculations
`lib/screens/results_screen.dart` lines 23-56:
```dart
Map<String, dynamic> calculateMetrics() {
  // Modify formulas here
}
```

## 📂 File Structure at a Glance

```
lib/
├── main.dart                    ← App entry point
├── screens/
│   ├── welcome_screen.dart      ← First screen
│   ├── basic_profile_screen.dart
│   ├── body_metrics_screen.dart
│   ├── dietary_preferences_screen.dart
│   └── results_screen.dart      ← Final screen
└── widgets/
    ├── progress_bar.dart
    ├── gender_selector.dart
    └── diet_card.dart
```

## 🔄 Screen Flow

```
Welcome → Basic Profile → Body Metrics → Dietary Prefs → Results
  (0%)      (33%)            (66%)          (100%)        (Done)
```

## 💡 Next Steps

1. **Test the flow**: Go through all screens
2. **Try different inputs**: Male/Female, various metrics
3. **Check calculations**: Verify BMI/BMR make sense
4. **Customize colors**: Make it your own
5. **Add features**: Extend functionality

## 📚 Learn More

- [README.md](README.md) - Full documentation
- [DESIGN.md](DESIGN.md) - Design system & specifications
- [Flutter Docs](https://docs.flutter.dev/) - Official documentation
- [Material Design](https://m3.material.io/) - Design guidelines

## 🆘 Need Help?

Common issues and their solutions:

| Issue | Solution |
|-------|----------|
| App won't build | Run `flutter clean && flutter pub get` |
| Hot reload not working | Press `R` for hot restart |
| Layout looks wrong | Check device orientation (portrait only) |
| Calculations seem off | Verify input units (metric vs imperial) |
| Missing dependencies | Run `flutter pub get` |

## 🎉 You're Ready!

The prototype is intentionally simple to be easy to understand and modify. Feel free to:
- Change colors and fonts
- Add new screens
- Modify calculations
- Integrate with your backend
- Add animations and polish

Happy coding! 🚀
