## Context

`mammamind.se` is a live, single-page-ish static site (plain HTML/CSS/vanilla
JS, no framework) plus a Supabase Postgres + Edge Functions backend and
Stripe Checkout for paid course bookings. It has a hero section, a "why
MammaMind" pitch, two course/workshop summary cards linking to two detail
pages, an about-me section, an FAQ, and a contact section, followed by a
shared footer include (`assets/js/includes.js` fetches `footer`/`form`
partial HTML via `data-include`).

This change ports only the presentational layer — content, layout, visual
styling — into a Flutter/Dart app, as a portfolio artifact demonstrating
Flutter competence for a job application. It is a new, separate repo/app;
there is no existing Flutter code or spec history to build on.

## Goals / Non-Goals

**Goals:**
- Visually close match to the live site: same color palette, spacing scale,
  typography rhythm, and section order, translated into Flutter/Material
  widgets.
- Real content parity: identical Swedish copy, real course/workshop details,
  real images (hero/about/course images) and SVG logo/icons.
- Working in-app navigation between the landing page and the two course
  detail pages (Flutter routing replacing the HTML `<a href>` links).
- Deployed and reachable at `https://cavepv.github.io/mammamind_flutter_dart/`.
- Buildable/testable via `flutter analyze` + `flutter test`, consistent with
  the author's other Flutter projects (`flutterCV`).

**Non-Goals:**
- No Supabase reads, no Stripe Checkout session creation, no Formspree form
  submission — the "Köp plats" button and "Anmäl intresse" form exist
  visually but are inert (tapping shows a static "this is a demo" message
  instead of calling a real endpoint).
- No state management library, no backend/API layer for content (mirrors
  the `flutterCV` project's own static-`const`-data philosophy) — course
  content lives as plain Dart data, not fetched from anywhere.
- No attempt to reproduce the CSP headers, Formspree integration, or footer
  partial-include mechanism — footer becomes a plain Flutter widget.
- No changes whatsoever to the live `mammamind` repo or production site.

## Decisions

1. **New standalone repo, not a branch of `mammamind`.**
   GitHub Pages project-site URLs are `https://<user>.github.io/<repo>/`,
   keyed off the repo name — a branch inside `mammamind` would not produce
   the target `mammamind_flutter_dart` path without extra Pages
   reconfiguration that risks the live site's own Pages/custom-domain (CNAME)
   setup. A separate repo is zero-risk to production and matches the URL
   exactly.

2. **Reuse the `flutterCV` GitHub Actions pattern verbatim.**
   `subosito/flutter-action` → `flutter pub get` → `flutter analyze` →
   `flutter test` → `flutter build web --base-href /mammamind_flutter_dart/`
   → `peaceiris/actions-gh-pages` publishing `build/web` to `gh-pages`. This
   is a proven, working template; no need to redesign CI/CD from scratch.

3. **Static `const` Dart data classes for course/workshop content**, mirroring
   `flutterCV`'s `cv_data.dart` approach — one `mammamind_data.dart` (or
   similar) holding page copy as Dart strings/objects. Keeps the "no backend"
   non-goal simple and consistent with the author's established minimalist
   pattern across their own Flutter projects.

4. **`flutter_svg` package for the source site's SVG assets** (logo,
   Instagram/email icons, favicon). The alternative — manually converting
   SVGs to `CustomPainter` Dart code — is far more effort for zero visual or
   skill-demonstration benefit; `flutter_svg` is a standard, widely-used
   package and doesn't compromise the "real Flutter/Dart work" goal.

5. **Routing via Flutter's built-in `Navigator` (named routes or simple
   `MaterialPageRoute` pushes)** — no `go_router`/declarative routing
   package. Three screens (landing + 2 course pages) with one-directional
   drill-down navigation don't need a routing library; stock `Navigator`
   is simpler and sufficient.

6. **Demo banner as one shared widget** (e.g. `DemoBanner`), placed at the
   top of every screen via a shared `Scaffold`-wrapping layout widget —
   single source of truth, not copy-pasted per screen.

7. **Inert CTA behavior**: "Köp plats" button and interest-registration form
   submit button both show a `SnackBar`/dialog reading something like "Det
   här är en Flutter/Dart-demo — riktig bokning sker på mammamind.se" rather
   than silently doing nothing (silent no-ops would look like bugs to a
   reviewer testing the app).

## Risks / Trade-offs

- [Near-pixel visual fidelity is open-ended effort] → Timebox it: match
  color palette, spacing scale, and section structure exactly; treat exact
  CSS-shadow/border-radius/font-hinting parity as a nice-to-have, not a
  blocker to calling this done.
- [Two "MammaMind" sites existing publicly could confuse a viewer] →
  Mitigated by the mandatory demo banner (see Decision 6) and by this
  design's non-goals explicitly keeping all real transactional flows
  pointed at the real site only.
- [SVG rendering via `flutter_svg` may not pixel-match browser SVG rendering
  exactly] → Acceptable; visually close is enough, this is a demo app not a
  design-QA deliverable.

## Migration Plan

- N/A (new standalone app, nothing to migrate). Rollback = delete the repo
  or stop the GitHub Pages deploy; no impact on any other system.

## Open Questions

- None blocking. Exact spacing/breakpoint values will be tuned during
  implementation by eye against the live site rather than pre-specified
  here.
