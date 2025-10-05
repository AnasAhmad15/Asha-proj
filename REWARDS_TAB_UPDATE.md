# Rewards Tab - Badges and Incentives Redesign

## Changes Made

### ✅ Redesigned Badges Section
Transformed badges from simple circles to modern card-based design matching your inspiration.

### ✅ Redesigned Available Incentives Section
Created a bordered white container with improved incentive items layout.

## New Design

### 1. **Badges Earned Section**

**Layout Changes:**
- **3x2 Grid** (6 badges total)
- **Card-based design** with white background
- **Subtle shadows** for depth
- **Border** around each card

**Badge Card Design:**
- White background with rounded corners (16px)
- Light border (`textLight.withOpacity(0.2)`)
- Subtle shadow for elevation
- **Colored circle icon** (56x56) with solid color fill
- **White icon** inside colored circle
- **Label below** (12px, semi-bold, centered)
- 2-line text support with ellipsis

**6 Badges:**
1. **Star Performer** - Amber/Gold star icon
2. **100 Visits** - Blue military tech/medal icon
3. **Top ASHA** - Purple trophy icon
4. **Community Hero** - Green gift icon
5. **Quick Responder** - Orange bolt icon
6. **Health Champion** - Red heart icon

**Grid Spacing:**
- 12px gap between cards
- Aspect ratio: 0.85 (slightly taller than wide)
- Responsive to screen size

### 2. **Available Incentives Section**

**Container Design:**
- White background with 20px padding
- Rounded corners (20px)
- Light border around entire section
- Subtle shadow for depth
- Contains all incentive items

**Incentive Item Design:**
- Light background with border
- 16px padding
- 12px border radius
- Horizontal layout (icon + text + button)

**Components:**
- **Icon Box** (48x48)
  - Colored background (10% opacity)
  - Rounded corners (12px)
  - Colored icon (24px)
  
- **Text Section**
  - Title (16px, bold)
  - Points (14px, colored, semi-bold)
  
- **Redeem Button**
  - Colored background (matches icon)
  - White text
  - 20px horizontal, 12px vertical padding
  - 10px border radius
  - No elevation (flat design)

**3 Incentives:**
1. **Mobile Data Pack** - 500 Points (Blue)
2. **Medical Kit Refill** - 1000 Points (Green)
3. **Training Certificate** - 750 Points (Purple)

## Design Features

### 🎨 Color Scheme
- **Badge Cards**: White with colored circle icons
- **Badge Icons**: Solid color fills (amber, blue, purple, green, orange, red)
- **Incentives Container**: White with border
- **Incentive Items**: Light background with borders
- **Buttons**: Color-matched to icons

### 📐 Layout
- **Badges**: 3 columns, 2 rows, card-based
- **Incentives**: Single bordered container
- **Spacing**: 12px between badges, 12px between incentives
- **Padding**: 20px in main container

### 📱 User Experience
- **Card-based badges**: More modern and professional
- **Clear visual hierarchy**: Icons stand out
- **Easy to scan**: Grid layout for badges
- **Organized incentives**: All in one bordered section
- **Color coding**: Each incentive has unique color
- **Large touch targets**: Easy to tap buttons

## Visual Comparison

### Badges Section

**Before:**
- Simple circles with icons
- Transparent backgrounds
- Border around circles
- Locked badges with gray color

**After:**
- White card backgrounds
- Solid colored circle icons
- White icons inside circles
- Subtle shadows and borders
- No locked state (all badges shown as earned)
- More professional appearance

### Incentives Section

**Before:**
- Individual cards for each item
- Standard Material Design cards
- Scattered appearance

**After:**
- Single bordered white container
- All items grouped together
- Cleaner, more organized look
- Consistent spacing
- Professional layout

## Technical Details

### Badge Widget
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(...),
    boxShadow: [...],
  ),
  child: Column(
    children: [
      Container(
        width: 56, height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color, // Solid color
        ),
        child: Icon(icon, color: Colors.white),
      ),
      Text(label),
    ],
  ),
)
```

### Incentives Container
```dart
Container(
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(...),
    boxShadow: [...],
  ),
  child: Column(
    children: [
      _IncentiveListItem(...),
      _IncentiveListItem(...),
      _IncentiveListItem(...),
    ],
  ),
)
```

### Incentive Item
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: AppTheme.backgroundWhite,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(...),
  ),
  child: Row(
    children: [
      Icon box (48x48),
      Text section,
      Redeem button,
    ],
  ),
)
```

## Badge Icons Updated

| Badge | Icon | Color |
|-------|------|-------|
| Star Performer | `Icons.star` | Amber |
| 100 Visits | `Icons.military_tech` | Blue |
| Top ASHA | `Icons.emoji_events` | Purple |
| Community Hero | `Icons.card_giftcard` | Green |
| Quick Responder | `Icons.bolt` | Orange |
| Health Champion | `Icons.favorite` | Red |

## Incentives Updated

| Incentive | Points | Icon | Color |
|-----------|--------|------|-------|
| Mobile Data Pack | 500 | `Icons.wifi` | Blue |
| Medical Kit Refill | 1000 | `Icons.medical_services_outlined` | Green |
| Training Certificate | 750 | `Icons.school_outlined` | Purple |

## How to Test

1. Run the app: `flutter run -d chrome` or `flutter run -d edge`
2. Select any language
3. Choose "ASHA Worker" role
4. Navigate to "Rewards" tab
5. See the redesigned sections:
   - **Badges**: 6 cards in 3x2 grid with colored circles
   - **Incentives**: Bordered white container with 3 items
   - Tap "Redeem" buttons (demo mode)

## Files Modified

1. `lib/screens/dashboards/asha_tabs/rewards_tab.dart`
   - Updated `_buildBadgesGrid()` - 3x2 grid, new aspect ratio
   - Updated `_buildIncentivesList()` - Bordered container
   - Redesigned `_Badge` widget - Card-based with solid color circles
   - Redesigned `_IncentiveListItem` widget - Horizontal layout with icon box
   - Removed `locked` parameter (not needed)
   - Added third incentive

## Accessibility Features

- **High Contrast**: White icons on colored circles
- **Clear Labels**: Text below each badge
- **Large Touch Targets**: Entire badge card is tappable
- **Visual Grouping**: Incentives in single container
- **Color Coding**: Each incentive has unique color
- **Readable Text**: 12-16px font sizes

## Next Steps (Optional)

- Add animation when tapping badges
- Add progress bars for locked badges
- Add more incentives
- Add redeem confirmation dialog
- Track redeemed incentives
- Integrate with backend when ready
