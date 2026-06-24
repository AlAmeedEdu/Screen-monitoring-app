source visual truth path:
- C:/Users/mohamed/Pictures/Screenshots/Screenshot 2026-06-24 130400.png
- C:/Users/mohamed/Pictures/Screenshots/Screenshot 2026-06-24 130423.png
- C:/Users/mohamed/Pictures/Screenshots/Screenshot 2026-06-24 130437.png

implementation screenshot path:
- blocked: no fresh post-change runtime screenshot was available in this turn.

viewport:
- mobile portrait app screens.

state:
- Login default and selected input state.
- Main tabs with four-item bottom navigation.
- Profile tab selected.
- Screens filter bottom sheet opened from filter button.

full-view comparison evidence:
- Source shows a four-item glass bottom navigation with profile/account tab.
- Source shows a complete profile page with avatar, settings toggles/menu, logout button, and active account nav state.
- Source shows monitors page filter button opening a rounded bottom sheet with status chips, fields, and apply button.
- Source shows login fields/slider updated from the previous version.

focused region comparison evidence:
- Login: input fills now use a soft grey resting state and focused teal-selected state.
- Navigation: MainBottomNav now has four items and maps account/classes/screens/home to the IndexedStack.
- Profile: ProfileView now renders the avatar composition, setting rows, switches, and logout button.
- Screens: filter icon now opens a modal bottom sheet matching the supplied filter layout.

findings:
- [P2] Visual runtime confirmation is still missing.
  Location: LoginView, MainBottomNav, ProfileView, ScreensView.
  Evidence: Dart analyzer passes, but no post-change device screenshot/video is available.
  Impact: final visual fidelity cannot be marked passed without comparing rendered screens against the supplied references.
  Fix: run the app, capture login, profile, monitors with filter sheet, and each selected nav state.

patches made since previous QA pass:
- Updated Login input fill/focused fill styling.
- Added account/profile item to the main bottom navigation.
- Updated MainLayout IndexedStack order to include ProfileView.
- Set default selected tab to Home after adding profile as the first tab.
- Re-adjusted ProfileView to match the provided structure image: background, profile picture box, one outer white card layer that contains the two inner subcards and the logout button.
- Rewired the screens filter button to open a filter bottom sheet.
- Built the screens filter bottom sheet with selectable status chips, AppTextField-based filter inputs, and apply action.

final result: blocked
