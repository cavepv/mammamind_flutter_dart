# mammamind_flutter_dart

A Flutter/Dart port of [mammamind.se](https://mammamind.se) — built as a
visual-fidelity tech demo for job-application showcase purposes. Static
content only, no backend; all "buy"/"book" actions show a demo-only
message instead of processing anything real.

- 🌐 **Web:** https://cavepv.github.io/mammamind_flutter_dart/
- 🤖 **Android APK:** built unsigned in CI, download the
  `mammamind-android-apk` artifact from the latest
  [Actions run](../../actions/workflows/deploy.yml)
- 🍎 **iOS:** compiles unsigned in CI (`--no-codesign`, macOS runner),
  download the `mammamind-ios-unsigned` artifact from the latest
  [Actions run](../../actions/workflows/deploy.yml) — no Apple Developer
  account, not tested on physical hardware

## Getting started

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d chrome        # or -d web-server --web-port 8080
```

## Architecture

- `lib/mammamind_data.dart` — static content (course/workshop copy, meta
  info) as `const` data, mirroring the source site's text.
- `lib/theme.dart` — colors, spacing, typography ported from the source
  site's CSS custom properties.
- `lib/landing_screen.dart`, `lib/course_detail_screen.dart`,
  `lib/workshop_detail_screen.dart` — the three pages ported from the
  source site.
- `lib/demo_banner.dart`, `lib/demo_action.dart` — a persistent "this is a
  demo" banner and the demo-only action handler used by every button that
  would otherwise process a real booking/payment.
