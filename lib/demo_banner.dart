// Persistent marker identifying this app as a Flutter/Dart tech demo, not
// the production mammamind.se site — required on every screen so the two
// can never be confused (see openspec design.md, Decision 6).

import 'package:flutter/material.dart';

import 'theme.dart';

class DemoBanner extends StatelessWidget {
  const DemoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MammaMindColors.textMain,
      padding: const EdgeInsets.symmetric(
        horizontal: MammaMindSpacing.xs,
        vertical: 6,
      ),
      child: Text(
        'Flutter/Dart tech demo — not the production site. '
        'Real site: mammamind.se',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: MammaMindColors.textWhite,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Shared scaffold wrapping every screen with the [DemoBanner] on top.
class MammaMindPage extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const MammaMindPage({super.key, required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          const DemoBanner(),
          Expanded(child: body),
        ],
      ),
    );
  }
}
