# AnyFeast Onboarding Flow - Flutter Prototype

A clean, minimalist onboarding experience for AnyFeast recipe kit delivery app. This prototype reduces the original 12-step flow to 5 streamlined screens with smart defaults and optional preferences.

## 🎨 Design Principles

### Minimalist Flat UI
- **Clean typography** using Inter/System fonts
- **Whitespace-driven** layout without heavy borders
- **Purposeful color** - primary red (#E63946) used sparingly
- **Smooth transitions** between screens
- **Accessible contrast** ratios throughout

### User Experience Optimizations
1. **Reduced friction**: 12 steps → 5 screens
2. **Progressive disclosure**: Essential info first, optional details later
3. **Smart defaults**: Pre-selected common options
4. **Skip options**: Allow completion later
5. **Real-time validation**: Immediate feedback on inputs
6. **Clear progress**: Visual progress indicator

## 📱 Screen Flow

### 1. Welcome Screen
- Hero illustration with vegetables and recipes
- Value proposition (3 key benefits)
- Single clear CTA
- Optional skip

### 2. Basic Profile (33% complete)
- Gender selection (horizontal cards)
- Birth year picker
- Combined into single screen

### 3. Body Metrics (66% complete)
- Height/Weight inputs
- Metric/Imperial toggle
- Clean text fields with validation

### 4. Dietary Preferences (100% complete)
- 6 diet options in grid (Balanced, Vegetarian, Vegan, Keto, Halal, Mediterranean)
- Optional allergy selection (8 common allergens)
- Skip option for allergies

### 5. Results Screen
- Success celebration
- Calculated health metrics (BMI, BMR, TDEE, Daily Goal)
- Protein target
- Diet plan summary
- Refinement option

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point & theme
├── screens/
│   ├── welcome_screen.dart           # Welcome with hero illustration
│   ├── basic_profile_screen.dart     # Gender & birth year
│   ├── body_metrics_screen.dart      # Height & weight
│   ├── dietary_preferences_screen.dart # Diet & allergies
│   └── results_screen.dart           # Calculated metrics
└── widgets/
    ├── progress_bar.dart             # Minimal progress indicator
    ├── gender_selector.dart          # Gender selection cards
    └── diet_card.dart                # Diet option cards
```

## 🎨 Design System

### Colors
```dart
Primary:     #E63946  // Warm red (CTA, accents)
Secondary:   #A8DADC  // Soft teal (protein card)
Background:  #FFFFFF  // Pure white
Surface:     #F1FAEE  // Off-white (input backgrounds)
Text:        #1D3557  // Deep blue-gray
Muted:       #457B9D  // Muted blue (subtitles)
```

### Typography
```dart
Heading Large:  28px, Bold     // Screen titles
Heading Medium: 24px, Bold     // Section titles
Title Large:    20px, SemiBold // Subsections
Body Large:     16px, Regular  // Main content
Body Medium:    14px, Regular  // Secondary text
```

### Spacing
```dart
xs: 4px   sm: 8px   md: 16px   lg: 24px   xl: 32px   xxl: 48px
```

### Border Radius
```dart
Small:  8px   // Chips, pills
Medium: 12px  // Buttons, inputs
Large:  16px  // Cards
XLarge: 20px  // Feature cards
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0.0 or higher
- Dart 3.0.0 or higher
- iOS Simulator / Android Emulator / Physical device

### Installation

1. **Clone or copy the project files**

2. **Navigate to project directory**
   ```bash
   cd anyfeast_onboarding
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   # iOS Simulator
   flutter run -d ios
   
   # Android Emulator
   flutter run -d android
   
   # Chrome (for quick testing)
   flutter run -d chrome
   ```

## 🧮 Health Calculations

The app calculates metrics using industry-standard formulas:

### BMI (Body Mass Index)
```
BMI = weight(kg) / (height(m))²
```

### BMR (Basal Metabolic Rate) - Mifflin-St Jeor Equation
```
Male:   BMR = (10 × weight) + (6.25 × height) - (5 × age) + 5
Female: BMR = (10 × weight) + (6.25 × height) - (5 × age) - 161
```

### TDEE (Total Daily Energy Expenditure)
```
TDEE = BMR × Activity Factor (1.55 for moderate activity)
```

### Daily Calorie Goal
```
Goal = TDEE - 200 (slight deficit for health optimization)
```

### Protein Target
```
Protein = weight(kg) × 1.6g (for active lifestyle)
```

## 🎯 Key Features

### State Management
- Local state with `setState` (sufficient for prototype)
- Form validation with controllers
- Navigation state preservation

### Animations
- Smooth screen transitions
- Animated selection states
- Progress bar animation
- Button scale effects (implicit)

### Accessibility
- Semantic labels ready (implement for production)
- High contrast ratios (WCAG AA compliant)
- Large touch targets (44×44pt minimum)
- Clear visual feedback

### Responsive Design
- Safe area handling
- Scrollable content
- Keyboard-aware layout
- Portrait orientation locked

## 🔧 Customization

### Changing Colors
Edit the theme in `main.dart`:
```dart
primaryColor: const Color(0xFFYOURCOLOR),
```

### Adding Fonts
1. Add fonts to `assets/fonts/`
2. Update `pubspec.yaml`:
   ```yaml
   fonts:
     - family: YourFont
       fonts:
         - asset: assets/fonts/YourFont-Regular.ttf
   ```
3. Set in theme:
   ```dart
   fontFamily: 'YourFont',
   ```

### Modifying Diet Options
Edit the `dietOptions` list in `dietary_preferences_screen.dart`

### Adjusting Calculations
Modify formulas in `results_screen.dart` → `calculateMetrics()`

## 📦 Production Considerations

### Before Production Deploy:
1. **State Management**: Implement BLoC/Provider for complex state
2. **Persistence**: Save profile with SharedPreferences/Hive
3. **Validation**: Add comprehensive input validation
4. **Error Handling**: Network requests, edge cases
5. **Analytics**: Track onboarding completion rates
6. **A/B Testing**: Test different flows
7. **Accessibility**: ARIA labels, screen reader support
8. **Internationalization**: Multi-language support
9. **Privacy**: Handle GDPR/CCPA compliance
10. **Backend Integration**: API calls for profile creation

## 🎨 Visual Assets

All visual elements are created with `CustomPainter` for:
- Zero dependencies
- Perfect scaling
- Theme consistency
- Small bundle size

For production, consider replacing with:
- SVG files (flutter_svg package)
- Lottie animations for success states
- Professional illustrations

## 📝 Notes

### Why This Design?
- **Reduced Steps**: Original had 12 steps; users drop off exponentially
- **Visual Hierarchy**: Clear primary actions reduce decision paralysis  
- **Optional Details**: Allergies optional - complete profile later
- **Smart Defaults**: Birth year picker centered on common age
- **Clear Progress**: Always know how far you've come
- **Celebration**: Results screen validates completion

### Performance
- Minimal dependencies (only Flutter SDK)
- StatelessWidgets where possible
- Efficient rebuilds with targeted setState
- No heavy computations on main thread
- < 100ms screen transitions

## 🤝 Contributing

This is a prototype for demonstration. For production use:
1. Add comprehensive testing
2. Implement proper state management
3. Add backend integration
4. Enhance accessibility
5. Add error boundaries

## 📄 License

This prototype is created for demonstration purposes.

---

**Made with ❤️ using Flutter**

Questions? Need modifications? Let me know!
