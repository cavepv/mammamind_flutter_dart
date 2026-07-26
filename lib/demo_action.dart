// Shared "this is a demo" feedback for CTAs that would call a real backend
// (Stripe checkout, Formspree submission) on the live mammamind.se site.
// See openspec design.md, Decision 7 — inert but not silent, so a reviewer
// tapping the button gets clear feedback instead of nothing happening.

import 'package:flutter/material.dart';

void showDemoOnlyMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        'Det här är en Flutter/Dart-demo — riktig bokning sker på '
        'mammamind.se',
      ),
    ),
  );
}
