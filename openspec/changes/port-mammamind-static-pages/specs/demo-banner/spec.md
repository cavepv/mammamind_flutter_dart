## ADDED Requirements

### Requirement: Persistent demo banner on every screen
Every screen in the app (landing, course detail, workshop detail) SHALL
display a visible banner or marker identifying the app as a Flutter/Dart
technology demo, not the production mammamind.se site, to prevent confusion
between the two.

#### Scenario: Demo banner visible on the landing screen
- **WHEN** the app opens to the landing screen
- **THEN** a banner reading (or equivalent to) "Flutter/Dart tech demo — not
  the production site" is visible

#### Scenario: Demo banner visible on detail screens
- **WHEN** the user navigates to a course or workshop detail screen
- **THEN** the same demo banner remains visible on that screen
