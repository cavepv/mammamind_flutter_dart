## ADDED Requirements

### Requirement: Landing page content
The app SHALL render a single scrollable landing screen containing, in the
same order as the source site (mammamind.se): hero (logo, headline, lead
text), a "Varför MammaMind?" section, a current-courses section with the
"Trygg återstart efter graviditet" course card, a workshops section with the
"Stark & smärtfri vardag" workshop card, an about-me section (text + photo),
an FAQ section, and a contact section.

#### Scenario: Landing page renders all sections
- **WHEN** the app opens
- **THEN** the landing screen shows the hero, "Varför MammaMind?", current
  courses, workshops, about-me, FAQ, and contact sections, each with the
  real Swedish copy from the source site

### Requirement: Landing page course cards link to detail screens
Each course/workshop summary card on the landing page SHALL navigate to its
corresponding detail screen when tapped.

#### Scenario: Tapping the course card navigates to its detail screen
- **WHEN** the user taps "Läs mer om kursen" on the "Trygg återstart efter
  graviditet" card
- **THEN** the app navigates to the course detail screen for that course

#### Scenario: Tapping the workshop card navigates to its detail screen
- **WHEN** the user taps "Läs mer om workshopen" on the "Stark & smärtfri
  vardag" card
- **THEN** the app navigates to the detail screen for that workshop

### Requirement: Landing page visual styling
The landing screen SHALL use a color palette, typography, and spacing that
closely matches the source site's `general.css` theme (background, card,
accent, and text colors; heading/body type scale).

#### Scenario: Landing page uses the source site's color palette
- **WHEN** the landing screen is rendered
- **THEN** background, card, and accent colors match the source site's
  defined palette (e.g. background `#dbd0bc`, accent `#c28f7a`)
