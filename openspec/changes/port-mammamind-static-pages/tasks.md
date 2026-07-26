## 1. Project setup

- [x] 1.1 Copy image/SVG assets from `~/Documents/mammamind/assets/images`
      and `assets/svg` into `assets/images/` and `assets/svg/` in this repo;
      register them in `pubspec.yaml`
- [x] 1.2 Add `flutter_svg` dependency to `pubspec.yaml`
- [x] 1.3 Define theme constants (colors, spacing, type scale) in a
      `lib/theme.dart` matching `general.css` custom properties

## 2. Content data

- [x] 2.1 Create `lib/mammamind_data.dart` with static `const` Dart data for:
      landing page copy (hero, why-section, about-me, FAQ entries, contact),
      and both course/workshop detail page copy (title, lead, bullets, meta,
      price)

## 3. Demo banner

- [x] 3.1 Build a shared `DemoBanner` widget
- [x] 3.2 Build a shared page-scaffold widget that wraps every screen with
      the `DemoBanner` at the top

## 4. Landing screen

- [x] 4.1 Build hero section (logo via `flutter_svg`, headline, lead text)
- [x] 4.2 Build "Varför MammaMind?" section
- [x] 4.3 Build current-courses section with the course summary card
- [x] 4.4 Build workshops section with the workshop summary card
- [x] 4.5 Build about-me section (text + image)
- [x] 4.6 Build FAQ section (expandable entries, matching `<details>`
      behavior via `ExpansionTile` or similar)
- [x] 4.7 Build contact section (Instagram + email links, matching icon
      style)
- [x] 4.8 Wire course/workshop card taps to navigate to their detail screens

## 5. Course & workshop detail screens

- [x] 5.1 Build the "Trygg återstart efter graviditet" course detail screen
      (lead, focus bullets, course meta, price, "Köp plats" button)
- [x] 5.2 Build the "Stark & smärtfri vardag" workshop detail screen (lead,
      focus bullets, workshop meta)
- [x] 5.3 Add inert "Köp plats" tap handler showing a demo-only message (no
      network call)
- [x] 5.4 Add an interest-registration form UI with an inert submit handler
      showing a demo-only message (no network call)
- [x] 5.5 Add back/logo navigation from both detail screens to the landing
      screen

## 6. Deployment

- [x] 6.1 Add `.github/workflows/deploy.yml` adapted from `flutterCV`'s
      `cv_app.yml` (test job + `deploy-web` job building with
      `--base-href /mammamind_flutter_dart/` and publishing to `gh-pages`)
- [x] 6.2 Enable GitHub Pages for this repo, serving from the `gh-pages`
      branch
- [x] 6.3 Push to `master`/`main`, confirm the Actions workflow deploys
      successfully, and verify the site loads at
      `https://cavepv.github.io/mammamind_flutter_dart/`

## 7. Verification

- [x] 7.1 Run `flutter analyze` — must be clean
- [x] 7.2 Add at least one smoke test per screen (landing renders sections;
      each detail screen renders its content; demo banner present on all
      screens) and run `flutter test`
- [x] 7.3 Manually compare the deployed site side-by-side with
      mammamind.se for visual fidelity (palette, spacing, section order)
