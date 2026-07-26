## ADDED Requirements

### Requirement: Course detail screen content
The app SHALL render a detail screen for the "Trygg återstart efter
graviditet" course, showing its real description, bullet-point focus areas,
course meta (start date, duration, day/time, location, baby policy,
prerequisites), price, and an early-bird bonus note, matching the source
site's `courses/trygg-aterstart-for-mammor.html` content.

#### Scenario: Course detail screen shows full course content
- **WHEN** the user navigates to the course detail screen
- **THEN** the screen displays the course title, lead description, focus
  bullet list, course meta list, price, and the "Köp plats" button

### Requirement: Workshop detail screen content
The app SHALL render a detail screen for the "Stark & smärtfri vardag"
workshop, showing its real description, bullet-point focus areas, and
workshop meta (date, time, location, capacity note), matching the source
site's `courses/workshop-smartfri-vardag.html` content.

#### Scenario: Workshop detail screen shows full workshop content
- **WHEN** the user navigates to the workshop detail screen
- **THEN** the screen displays the workshop title, lead description, focus
  bullet list, and workshop meta list

### Requirement: Detail screens have no real backend calls
Both detail screens SHALL NOT call any live Stripe, Supabase, or Formspree
endpoint. The "Köp plats" button and "Anmäl intresse" form submission SHALL
show an in-app message indicating this is a demo, instead of performing a
real transaction or submission.

#### Scenario: Tapping "Köp plats" shows a demo message
- **WHEN** the user taps the "Köp plats" button on the course detail screen
- **THEN** the app shows a message stating this is a Flutter/Dart demo and
  no purchase or network request is made

#### Scenario: Submitting the interest form shows a demo message
- **WHEN** the user submits the "Anmäl intresse" form
- **THEN** the app shows a message stating this is a Flutter/Dart demo and
  no form submission or network request is made

### Requirement: Detail screens navigate back to the landing screen
Each detail screen SHALL provide a way to return to the landing screen
(e.g. an app bar back action or a logo link), matching the source site's
"logo links back to home" pattern.

#### Scenario: Back navigation returns to the landing screen
- **WHEN** the user taps the back/logo control on a course or workshop
  detail screen
- **THEN** the app navigates back to the landing screen
