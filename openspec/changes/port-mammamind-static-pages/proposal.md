## Why

This project is a Flutter/Dart skills showcase built for a job application
(LumenRadio, Senior Mobile App Developer — Flutter for iOS/Android). The
author's real live product, mammamind.se (static HTML/CSS/JS + Supabase
backend + Stripe checkout), needs a Flutter/Dart equivalent of its public
content so it can be pointed to as concrete proof of shipping a real,
near-pixel-accurate Flutter app across iOS/Android/Web from one codebase.

## What Changes

- Port the static, public-facing content of mammamind.se to Flutter/Dart:
  the landing page and both course detail pages.
- Visually match the source site's layout, color palette, spacing, and
  typography as closely as Flutter/Material allows (near-pixel fidelity is
  the goal, not just structural/content parity).
- Reuse real copy, images, and SVG assets from the source site (owned by
  the author) — no genericized/placeholder content.
- Add a visible "Flutter/Dart tech demo — not the production site" banner
  so the app cannot be mistaken for a second live mammamind business.
- **No backend integration**: no Supabase reads, no Stripe checkout calls,
  no interest-registration form submission. The "Köp plats" (buy) button
  and "Anmäl intresse" (register interest) form are rendered for visual
  fidelity but are inert (no-op or a static "demo only" message) — this is
  explicitly out of scope per the parent decision (UI/UX showcase only,
  read-only/static, not a functional port).
- Deploy to GitHub Pages at `https://cavepv.github.io/mammamind_flutter_dart/`
  via a GitHub Actions workflow, following the same pattern already proven
  in the author's `flutterCV` repo (flutter-action + `flutter build web
  --base-href` + `peaceiris/actions-gh-pages`).

## Capabilities

### New Capabilities
- `landing-page`: renders the mammamind.se home page content (hero, "why
  MammaMind", current courses/workshops summary cards, about-me section,
  FAQ, contact section) as a single scrollable Flutter screen.
- `course-detail-pages`: renders the two course/workshop detail pages
  ("Trygg återstart efter graviditet" and "Stark & smärtfri vardag"
  workshop) as separate routed Flutter screens, linked from the landing
  page's course cards.
- `demo-banner`: a persistent, visible banner/marker present on every
  screen identifying the app as a non-production Flutter/Dart tech demo.

### Modified Capabilities
(none — this is a new, standalone repo/app; no existing specs to modify)

## Impact

- Affected: new repo `mammamind_flutter_dart` only. Zero changes to the
  live `mammamind` repo, `mammamind.se` production site, or its Supabase/
  Stripe backend.
- New code: `lib/` Flutter widgets/screens/routing, `assets/` (copied
  images/SVGs from the source site), `.github/workflows/` deploy pipeline.
- Dependencies: stock Flutter SDK only; add `flutter_svg` if needed to
  render the source site's SVG logo/icons without manual conversion to
  Flutter-native vector code (small, single-purpose, already-common
  package — consistent with this project's "showcase real Flutter code"
  goal, not a shortcut around learning the framework).
