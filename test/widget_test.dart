// Smoke tests: each screen renders its key content, and the demo banner is
// present everywhere (openspec task 7.2).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mammamind_flutter_dart/demo_banner.dart';
import 'package:mammamind_flutter_dart/landing_screen.dart';
import 'package:mammamind_flutter_dart/main.dart';
import 'package:mammamind_flutter_dart/mammamind_data.dart';

/// Course/workshop CTAs sit far down the landing ListView; a default
/// 800x600 test surface culls them out of the render tree entirely.
void _makeSurfaceTall(WidgetTester tester) {
  tester.view.physicalSize = const Size(800, 4000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void main() {
  testWidgets('Landing screen shows demo banner and hero headline',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MammaMindApp());
    await tester.pumpAndSettle();

    expect(find.byType(DemoBanner), findsOneWidget);
    expect(find.text(MammaMindData.heroHeadline), findsOneWidget);
  });

  testWidgets('Navigating to course detail shows demo banner and course title',
      (WidgetTester tester) async {
    _makeSurfaceTall(tester);
    await tester.pumpWidget(const MammaMindApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Läs mer om kursen'));
    await tester.pumpAndSettle();

    expect(find.byType(DemoBanner), findsOneWidget);
    expect(find.text(MammaMindData.courseTitle), findsWidgets);
  });

  testWidgets(
      'Navigating to workshop detail shows demo banner and workshop title',
      (WidgetTester tester) async {
    _makeSurfaceTall(tester);
    await tester.pumpWidget(const MammaMindApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Läs mer om workshopen'));
    await tester.pumpAndSettle();

    expect(find.byType(DemoBanner), findsOneWidget);
    expect(find.text(MammaMindData.workshopTitle), findsWidgets);
  });

  testWidgets('Course CTA shows demo-only message instead of navigating away',
      (WidgetTester tester) async {
    _makeSurfaceTall(tester);
    await tester.pumpWidget(const MaterialApp(home: LandingScreen()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Läs mer om kursen'));
    await tester.pumpAndSettle();

    await tester.tap(find.textContaining('Köp plats'));
    await tester.pump();

    expect(find.textContaining('Flutter/Dart-demo'), findsOneWidget);
  });
}
