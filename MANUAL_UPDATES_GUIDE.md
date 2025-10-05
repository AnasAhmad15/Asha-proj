# Manual Updates Guide - Demo Names & Language Translation

## Task 1: Replace ALL Dummy Names with Realistic Mixed Names

### Mixed Indian Names Pool (Hindu + Muslim)

**Male Names:**
- Ramesh Kumar (Hindu)
- Mohammed Aslam (Muslim)
- Arjun Singh (Hindu)
- Farhan Sheikh (Muslim)
- Vijay Sharma (Hindu)
- Imran Khan (Muslim)
- Suresh Patel (Hindu)
- Abdul Rahman (Muslim)
- Ravi Yadav (Hindu)
- Salman Ahmed (Muslim)

**Female Names:**
- Sunita Devi (Hindu)
- Fatima Begum (Muslim)
- Priya Sharma (Hindu)
- Ayesha Khan (Muslim)
- Anjali Kumari (Hindu)
- Zainab Ansari (Muslim)
- Meena Verma (Hindu)
- Nazia Siddiqui (Muslim)
- Kavita Singh (Hindu)
- Rukhsar Ali (Muslim)

---

## Files to Update:

### 1. PHC Dashboard - Patient Records Tab
**File:** `lib/screens/dashboards/phc_tabs/patient_records_tab.dart`

**Line 32:** Change from `'Patient Name ${index + 1}'` to actual names:
```dart
final names = [
  'Ramesh Kumar', 'Fatima Begum', 'Arjun Singh', 'Ayesha Khan',
  'Vijay Sharma', 'Zainab Ansari', 'Mohammed Aslam', 'Sunita Devi',
  'Farhan Sheikh', 'Priya Sharma'
];
return _PatientListItem(
  name: names[index],
  id: 'PID-2024-${1001 + index}',
  lastConsult: '2024-09-${15 + index}',
);
```

### 2. PHC Dashboard - Staff Monitoring Tab
**File:** `lib/screens/dashboards/phc_tabs/staff_monitoring_tab.dart`

**Line 15:** Change from `'ASHA Worker ${index + 1}'` to:
```dart
final ashaNames = [
  'Sunita Devi', 'Fatima Begum', 'Priya Sharma', 'Ayesha Khan',
  'Anjali Kumari', 'Zainab Ansari', 'Meena Verma', 'Nazia Siddiqui'
];
return _StaffListItem(
  name: ashaNames[index],
  area: 'Sector ${index % 4 + 1}',
  lastSync: '${index * 10 + 5} mins ago',
  tasksCompleted: 15 - index,
);
```

### 3. PHC Dashboard - Feedback Tab
**File:** `lib/screens/dashboards/phc_tabs/feedback_tab.dart`

**Line 15:** Change from `'ASHA Worker ${index + 1}'` to:
```dart
final ashaNames = ['Sunita Devi', 'Fatima Begum', 'Priya Sharma', 'Ayesha Khan', 'Anjali Kumari'];
return _FeedbackListItem(
  ashaName: ashaNames[index],
  feedback: 'Need more medical supplies for vaccination drive in my area.',
  timestamp: '2024-09-${20 + index} 10:30 AM',
  isAddressed: index % 2 == 0,
);
```

### 4. Supervisor Dashboard - Staff Performance Tab
**File:** `lib/screens/dashboards/supervisor_tabs/staff_performance_tab.dart`

**Line 51:** Change from `'ASHA Worker ${index + 1}'` to:
```dart
final staffNames = [
  'Sunita Devi', 'Fatima Begum', 'Priya Sharma', 'Ayesha Khan',
  'Anjali Kumari', 'Zainab Ansari', 'Meena Verma', 'Nazia Siddiqui'
];
return _StaffPerformanceListItem(
  name: staffNames[index],
  performanceScore: 95 - (index * 5),
  area: 'Sector ${index % 4 + 1}',
);
```

### 5. Supervisor Dashboard - Feedback Tab
**File:** `lib/screens/dashboards/supervisor_tabs/feedback_tab.dart`

**Line 42:** Change from `'${isAsha ? 'ASHA Worker' : 'PHC Staff'} ${index + 1}'` to:
```dart
final ashaNames = ['Sunita Devi', 'Fatima Begum', 'Priya Sharma', 'Ayesha Khan', 'Anjali Kumari'];
final phcNames = ['Dr. Ramesh Kumar', 'Dr. Mohammed Aslam', 'Nurse Kavita Singh'];
return _FeedbackListItem(
  sourceName: isAsha ? ashaNames[index] : phcNames[index],
  feedback: 'Need better coordination for vaccination campaigns.',
  timestamp: '2024-09-${20 + index} 10:30 AM',
  isAddressed: index % 2 != 0,
);
```

---

## Task 2: Complete Language Translation

### Files Needing Translation Updates:

#### 1. PHC Dashboard - Patient Records Tab
**File:** `lib/screens/dashboards/phc_tabs/patient_records_tab.dart`

Add translation method and update all text:
```dart
String _getText(String en, String hi, String mr) {
  switch (language) {
    case 'hi':
      return hi;
    case 'mr':
      return mr;
    default:
      return en;
  }
}
```

Update texts:
- Line 16: `hintText: _getText('Search Patients...', 'रोगी खोजें...', 'रुग्ण शोधा...')`
- Add translations for "Patient ID", "Last Consultation", etc.

#### 2. PHC Dashboard - Staff Monitoring Tab
**File:** `lib/screens/dashboards/phc_tabs/staff_monitoring_tab.dart`

Add language parameter and translations:
```dart
class StaffMonitoringTab extends StatelessWidget {
  final String language;
  const StaffMonitoringTab({super.key, required this.language});
  
  String _getText(String en, String hi, String mr) {
    switch (language) {
      case 'hi': return hi;
      case 'mr': return mr;
      default: return en;
    }
  }
}
```

Translate:
- "Staff Monitoring" → "स्टाफ निगरानी" (Hindi) / "कर्मचारी निरीक्षण" (Marathi)
- "Area" → "क्षेत्र" (Hindi) / "क्षेत्र" (Marathi)
- "Last Sync" → "अंतिम सिंक" (Hindi) / "शेवटचे सिंक" (Marathi)
- "Tasks Completed" → "कार्य पूर्ण" (Hindi) / "कार्ये पूर्ण" (Marathi)

#### 3. PHC Dashboard - Feedback Tab
**File:** `lib/screens/dashboards/phc_tabs/feedback_tab.dart`

Add language support:
```dart
class FeedbackTab extends StatelessWidget {
  final String language;
  const FeedbackTab({super.key, required this.language});
  
  String _getText(String en, String hi, String mr) {
    switch (language) {
      case 'hi': return hi;
      case 'mr': return mr;
      default: return en;
    }
  }
}
```

Translate:
- "Feedback" → "प्रतिक्रिया" (Hindi) / "अभिप्राय" (Marathi)
- "Addressed" → "संबोधित" (Hindi) / "संबोधित" (Marathi)
- "Pending" → "लंबित" (Hindi) / "प्रलंबित" (Marathi)

#### 4. PHC Dashboard - Reports Tab
**File:** `lib/screens/dashboards/phc_tabs/reports_forecasting_tab.dart`

Add translations for:
- "Monthly Report" → "मासिक रिपोर्ट" (Hindi) / "मासिक अहवाल" (Marathi)
- "Generate Report" → "रिपोर्ट बनाएं" (Hindi) / "अहवाल तयार करा" (Marathi)
- "Download" → "डाउनलोड करें" (Hindi) / "डाउनलोड करा" (Marathi)

#### 5. Supervisor Dashboard - All Tabs
**Files:**
- `lib/screens/dashboards/supervisor_tabs/impact_score_tab.dart`
- `lib/screens/dashboards/supervisor_tabs/seasonal_forecasting_tab.dart`
- `lib/screens/dashboards/supervisor_tabs/staff_performance_tab.dart`
- `lib/screens/dashboards/supervisor_tabs/feedback_tab.dart`

Add language parameter to each and translate all visible text.

---

## Key Translation Phrases:

### Common UI Elements:
| English | Hindi | Marathi |
|---------|-------|---------|
| Search | खोजें | शोधा |
| View | देखें | पहा |
| Edit | संपादित करें | संपादित करा |
| Delete | हटाएं | हटवा |
| Save | सहेजें | जतन करा |
| Cancel | रद्द करें | रद्द करा |
| Submit | जमा करें | सबमिट करा |
| Back | वापस | मागे |
| Next | अगला | पुढे |
| Close | बंद करें | बंद करा |

### Medical Terms:
| English | Hindi | Marathi |
|---------|-------|---------|
| Patient | रोगी | रुग्ण |
| Doctor | डॉक्टर | डॉक्टर |
| Nurse | नर्स | परिचारिका |
| Medicine | दवा | औषध |
| Treatment | उपचार | उपचार |
| Consultation | परामर्श | सल्लामसलत |
| Vaccination | टीकाकरण | लसीकरण |
| Checkup | जांच | तपासणी |
| Report | रिपोर्ट | अहवाल |
| Record | रिकॉर्ड | रेकॉर्ड |

### Dashboard Terms:
| English | Hindi | Marathi |
|---------|-------|---------|
| Dashboard | डैशबोर्ड | डॅशबोर्ड |
| Performance | प्रदर्शन | कामगिरी |
| Feedback | प्रतिक्रिया | अभिप्राय |
| Staff | स्टाफ | कर्मचारी |
| Monitoring | निगरानी | निरीक्षण |
| Area | क्षेत्र | क्षेत्र |
| Sector | सेक्टर | क्षेत्र |
| Score | स्कोर | गुण |
| Rating | रेटिंग | रेटिंग |

---

## Implementation Steps:

### Step 1: Update All Dummy Names (30 minutes)
1. Open each file listed above
2. Replace dummy name generators with actual name arrays
3. Use mixed Hindu + Muslim names from the pool
4. Test each dashboard to verify names appear correctly

### Step 2: Add Language Support (1-2 hours)
1. Add `language` parameter to all tab widgets that don't have it
2. Add `_getText()` method to each widget
3. Replace all hardcoded English text with `_getText()` calls
4. Use the translation table above for reference
5. Test with Hindi and Marathi to verify translations

### Step 3: Verify Complete Translation
1. Select Hindi at language selection
2. Go through each role dashboard
3. Check every screen, button, label
4. Ensure NO English text remains
5. Repeat for Marathi

---

## Quick Test Checklist:

### PHC Dashboard (Hindi):
- [ ] Patient Records tab - all text in Hindi
- [ ] Reports tab - all text in Hindi
- [ ] Feedback tab - all text in Hindi
- [ ] Staff Monitoring tab - all text in Hindi
- [ ] All patient names are realistic (mixed)
- [ ] All ASHA worker names are realistic (mixed)

### Supervisor Dashboard (Hindi):
- [ ] Impact Score tab - all text in Hindi
- [ ] Forecasting tab - all text in Hindi
- [ ] Staff Performance tab - all text in Hindi
- [ ] Feedback tab - all text in Hindi
- [ ] All staff names are realistic (mixed)

### ASHA Dashboard (Hindi):
- [ ] Already has good language support
- [ ] Verify all names are realistic (already done)

---

## Priority Order:

1. **HIGH PRIORITY:** Replace dummy names in PHC and Supervisor dashboards
2. **HIGH PRIORITY:** Add language support to PHC tabs
3. **MEDIUM PRIORITY:** Add language support to Supervisor tabs
4. **LOW PRIORITY:** Fine-tune translations

This will make your app look like a complete, professional, inclusive demo prototype!
