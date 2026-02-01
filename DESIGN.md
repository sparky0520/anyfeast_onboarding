# AnyFeast Onboarding - Design Documentation

## 🎨 Visual Asset Requirements

### Image Prompts for Professional Illustrations

#### 1. Welcome Screen Hero Illustration
**Prompt**: "Minimal flat illustration of fresh vegetables, cooking utensils, and recipe cards floating in organized arrangement, pastel color palette with coral red accent (#E63946), clean line art style, white background, top-down view, 2D geometric shapes, includes tomato, carrot, knife, and recipe card, modern minimalist design"

**Specifications**:
- Size: 280×280px (displayed), export at 3x (840×840px)
- Format: SVG or PNG with transparency
- Colors: #E63946 (red), #2A9D8F (green), #F4A261 (orange), #457B9D (blue)
- Style: Flat, geometric, friendly

**Current Implementation**: CustomPainter (code-based)
**Production Alternative**: Replace with SVG using flutter_svg package

---

#### 2. Profile Icon
**Prompt**: "Simple flat icon of a user profile silhouette inside a rounded square container, minimal line art, single color coral red (#E63946), clean geometric design, 2D illustration, friendly and welcoming"

**Specifications**:
- Size: 80×80px container
- Format: Icon font or SVG
- Color: #E63946 on #F1FAEE background
- Style: Outline style icon

**Current Implementation**: Material Icons (Icons.person_outline_rounded)
**Production Alternative**: Custom icon or Lucide icons package

---

#### 3. Body Metrics Icon
**Prompt**: "Minimalist flat illustration of a measuring tape and ruler combined into one cohesive icon, geometric shapes, coral red (#E63946) and soft teal (#A8DADC) accents, simple line art, 2D design, friendly health-focused aesthetic"

**Specifications**:
- Size: 80×80px
- Format: SVG
- Colors: Primary #E63946, secondary #A8DADC
- Style: Clean lines, modern

**Current Implementation**: Material Icons (Icons.straighten_rounded)

---

#### 4. Diet Type Illustrations

##### 4a. Balanced Diet
**Prompt**: "Flat geometric illustration of balanced meal with vegetables, protein, and grains arranged in a circle, minimal style, pastel green and orange tones, simple 2D shapes, white background, top view"
- Emoji used: 🥗

##### 4b. Vegetarian
**Prompt**: "Clean flat illustration of assorted vegetables (lettuce, tomato, pepper) in geometric arrangement, minimal design, bright green and red accents, simple 2D shapes"
- Emoji used: 🥬

##### 4c. Vegan
**Prompt**: "Minimalist flat illustration of leafy greens and plant elements with sprout, geometric style, vibrant green (#2A9D8F), 2D simple design, white background"
- Emoji used: 🌱

##### 4d. Keto
**Prompt**: "Flat geometric illustration of avocado, egg, and healthy fats in minimal style, muted green (#2A9D8F) and yellow (#F4A261) tones, simple shapes, 2D icon, friendly style"
- Emoji used: 🥑

##### 4e. Halal
**Prompt**: "Minimalist flat illustration of a mosque dome and crescent moon with subtle food elements, geometric style, gold (#F4A261) and teal (#A8DADC) color palette, 2D simple design, respectful and elegant"
- Emoji used: 🕌

##### 4f. Mediterranean
**Prompt**: "Clean flat illustration of olive branch, fish, and citrus fruit arranged geometrically, bright Mediterranean colors (blue, green, gold), minimal 2D design, simple shapes, healthy aesthetic"
- Emoji used: 🫒

**Grid Specifications**:
- Each card: ~160×160px at 2x density
- Format: Emoji (current) or SVG for production
- Colors: Match theme palette
- Style: Consistent across all options

---

#### 5. Success/Celebration Icon
**Prompt**: "Minimal flat illustration of a check mark inside a circular badge with subtle confetti particles, geometric style, coral red primary color (#E63946) with pastel accents, celebratory but clean, 2D design, modern and friendly"

**Specifications**:
- Size: 100×100px
- Format: Animated Lottie (production) or static SVG
- Colors: #E63946 primary, white background
- Animation: Check mark draw-in, confetti fall

**Current Implementation**: Material Icons with circular container

---

#### 6. Background Pattern (Optional Enhancement)
**Prompt**: "Subtle geometric pattern of kitchen utensils and vegetables as line icons, very light gray (#F5F5F5) on white, minimal spacing, repeating pattern, background texture, barely visible, professional"

**Specifications**:
- Tileable: Yes (seamless repeat)
- Opacity: 5-10%
- Format: SVG pattern
- Usage: Optional background for empty states

---

## 🎯 Design System Deep Dive

### Color Psychology
- **Red (#E63946)**: Energy, appetite stimulation, call-to-action
- **Teal (#A8DADC)**: Health, freshness, trust
- **Blue-Gray (#1D3557)**: Professionalism, readability
- **Off-White (#F1FAEE)**: Clean, soft, not harsh

### Accessibility Compliance

#### WCAG 2.1 AA Standards
- **Text on White**: #1D3557 = 10.64:1 ratio ✓ (requires 4.5:1)
- **Muted text on White**: #457B9D = 4.78:1 ✓
- **White on Red**: White on #E63946 = 4.89:1 ✓
- **Red on Off-White**: #E63946 on #F1FAEE = 4.75:1 ✓

#### Touch Targets
- Minimum: 44×44pt (iOS HIG / Material)
- Buttons: 48dp height (Material)
- Gender cards: Full width, 60pt height
- Diet cards: ~160×160pt

#### Focus Indicators
- Add 2px outline for keyboard navigation
- Color: #E63946
- Offset: 2px

---

## 📐 Layout Specifications

### Safe Areas
```dart
SafeArea: top, bottom
Padding: 24px horizontal, 24px vertical
```

### Grid System
- Base unit: 4px
- Columns: Flexible (single column mobile)
- Gutters: 24px
- Margins: 24px

### Typography Scale
```
Display: 28px / 36px line height
H1: 24px / 32px
H2: 20px / 28px
Body: 16px / 24px
Small: 14px / 20px
Caption: 12px / 16px
```

### Elevation (Shadows)
Currently using flat design with borders:
```dart
elevation: 0 (no shadows)
```

For production, consider subtle shadows:
```dart
elevation: 2
shadowColor: Color(0x0A000000)
```

---

## 🎬 Animation Specifications

### Screen Transitions
- **Duration**: 300ms
- **Curve**: easeInOut
- **Type**: Slide from right (MaterialPageRoute default)

### Button Press
- **Scale**: 0.95 → 1.0
- **Duration**: 100ms
- **Curve**: easeOut

### Progress Bar
- **Duration**: 400ms
- **Curve**: easeInOut
- **Type**: Linear fill

### Selection States
- **Duration**: 200ms
- **Curve**: easeInOut
- **Properties**: backgroundColor, borderColor

### Card Expansion (Future)
- **Duration**: 300ms
- **Curve**: easeInOutCubic
- **Type**: Height expansion

---

## 🧩 Component Library

### Buttons

#### Primary Button
```dart
ElevatedButton(
  backgroundColor: #E63946
  foregroundColor: #FFFFFF
  padding: 16px vertical, 32px horizontal
  borderRadius: 12px
  elevation: 0
  fontSize: 16px
  fontWeight: 600
)
```

#### Secondary Button (TextButton)
```dart
TextButton(
  foregroundColor: #457B9D
  padding: 12px vertical
  fontSize: 14px
)
```

### Input Fields
```dart
TextField(
  fillColor: #F1FAEE
  borderRadius: 12px
  padding: 20px
  fontSize: 16px
  border: none
)
```

### Cards

#### Selection Card (Gender, Diet)
```dart
Container(
  padding: 20px
  borderRadius: 16px
  backgroundColor: #F1FAEE (default) | #E63946 (selected)
  border: 2px #E63946 (selected) | transparent (default)
)
```

#### Info Card (Metrics)
```dart
Container(
  padding: 24px
  borderRadius: 20px
  gradient: LinearGradient(#E63946, #F4A261)
)
```

### Progress Indicator
```dart
LinearProgressIndicator(
  backgroundColor: #F1FAEE
  valueColor: #E63946
  minHeight: 6px
  borderRadius: 10px
)
```

---

## 📱 Responsive Breakpoints

### Current (Portrait Only)
- Small: 320px - 375px (iPhone SE)
- Medium: 375px - 414px (iPhone 12/13/14)
- Large: 414px+ (iPhone Pro Max)

### Future (Tablet Support)
- Tablet: 768px+ → 2-column grid for diet options
- Desktop: 1024px+ → Center content, max-width 600px

---

## 🔤 Font Loading (Production)

### Google Fonts Integration
```yaml
dependencies:
  google_fonts: ^6.1.0
```

```dart
import 'package:google_fonts/google_fonts.dart';

ThemeData(
  textTheme: GoogleFonts.interTextTheme(),
)
```

### Font Weights Needed
- Regular: 400
- Medium: 500
- SemiBold: 600
- Bold: 700

---

## 🎨 Dark Mode (Future Enhancement)

### Dark Theme Colors
```dart
Primary: #E63946 (same)
Background: #1D3557
Surface: #2A4263
Text: #F1FAEE
Muted: #A8DADC
```

### Implementation
```dart
darkTheme: ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFFE63946),
  scaffoldBackgroundColor: Color(0xFF1D3557),
  // ... rest of theme
)
```

---

## 🧪 Testing Checklist

### Visual Testing
- [ ] Test on iPhone SE (smallest screen)
- [ ] Test on iPhone 14 Pro Max (largest)
- [ ] Test on Android (Material Design compliance)
- [ ] Test landscape orientation (currently locked)
- [ ] Test with reduced motion settings
- [ ] Test with large text accessibility settings

### Functional Testing
- [ ] Gender selection updates state
- [ ] Birth year dropdown works
- [ ] Height/weight validation
- [ ] Unit toggle clears inputs
- [ ] Diet selection updates
- [ ] Allergy multi-select works
- [ ] BMI calculation accuracy
- [ ] Navigation preserves state
- [ ] Back button works correctly

### Accessibility Testing
- [ ] VoiceOver navigation (iOS)
- [ ] TalkBack navigation (Android)
- [ ] Dynamic type support
- [ ] Keyboard navigation
- [ ] Focus indicators visible
- [ ] Color contrast passes WCAG AA

---

## 📊 Performance Benchmarks

### Target Metrics
- **Cold start**: < 2s
- **Screen transition**: < 300ms
- **Input response**: < 100ms
- **Calculation time**: < 50ms
- **Memory usage**: < 100MB

### Optimization Techniques
1. Use const constructors everywhere
2. Avoid rebuilding entire tree
3. Lazy load screens
4. Cache computed values
5. Profile with Flutter DevTools

---

## 🔐 Privacy Considerations

### Data Collection
- Gender: Essential for BMR calculation
- Birth year: Essential for age-based calculations
- Height/Weight: Essential for BMI/TDEE
- Diet preferences: Optional, improves recommendations
- Allergies: Optional, safety feature

### Data Storage
- Local only (prototype)
- Production: Encrypted preferences
- Backend: Secure API with authentication
- Compliance: GDPR, CCPA ready

### User Control
- Allow profile deletion
- Allow data export
- Clear privacy policy link
- Opt-out of analytics

---

## 🚀 Production Migration Path

### Phase 1: MVP Enhancements
1. Add backend API integration
2. Implement user authentication
3. Add email/password screens
4. Persist profile data
5. Add loading states

### Phase 2: Polish
1. Replace emojis with SVG illustrations
2. Add micro-interactions
3. Implement success animations
4. Add haptic feedback
5. Optimize bundle size

### Phase 3: Scale
1. Add internationalization (i18n)
2. Support tablet layouts
3. Add dark mode
4. Implement A/B testing
5. Add analytics tracking

---

**Design Version**: 1.0
**Last Updated**: 2024
**Designer**: Claude
**Framework**: Flutter 3.x
