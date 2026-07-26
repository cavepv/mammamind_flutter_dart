// Landing screen: ports mammamind.se's index.html sections (hero, why,
// courses, workshops, about-me, FAQ, contact) into one scrollable screen.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'course_detail_screen.dart';
import 'demo_banner.dart';
import 'footer.dart';
import 'mammamind_data.dart';
import 'theme.dart';
import 'workshop_detail_screen.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});

  // Scroll anchor for the hero's scroll-indicator button.
  final GlobalKey _coursesKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MammaMindPage(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _Hero(
            onScrollIndicatorTap: () {
              // ponytail: courses section may not be built yet (lazy
              // ListView) when this is tapped right after first paint;
              // currentContext is null until it's laid out, so guard it.
              final ctx = _coursesKey.currentContext;
              if (ctx != null) {
                Scrollable.ensureVisible(
                  ctx,
                  duration: const Duration(milliseconds: 400),
                );
              }
            },
          ),
          const SizedBox(height: MammaMindSpacing.lg),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: kContentMaxWidth),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MammaMindSpacing.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _WhyMammaMindSection(),
                    const _Divider(),
                    Container(
                      key: _coursesKey,
                      child: _CurrentCoursesSection(),
                    ),
                    const _Divider(),
                    _WorkshopsSection(),
                    const _Divider(),
                    _AboutMeSection(),
                    const _Divider(),
                    _FaqSection(),
                    const SizedBox(height: MammaMindSpacing.md),
                    _ContactSection(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: MammaMindSpacing.lg),
          const MammaMindFooter(),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      // ponytail: 60px doesn't map to an existing MammaMindSpacing token;
      // hardcoded per explicit user request rather than adding a one-off
      // spacing constant for a single usage.
      padding: EdgeInsets.symmetric(vertical: 60),
      child: SizedBox(
        // ponytail: width must be explicit - without it the DecoratedBox
        // has no intrinsic size and collapses to zero width inside a
        // Column, making the divider invisible.
        width: double.infinity,
        height: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00B89061),
                MammaMindColors.cardBorder,
                Color(0x00B89061),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  final VoidCallback onScrollIndicatorTap;

  const _Hero({required this.onScrollIndicatorTap});

  @override
  Widget build(BuildContext context) {
    // ponytail: full-bleed like the source <header class="hero"> - no
    // padding/rounded clipping, spans the full viewport width and starts
    // right at the top of the scroll body.
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/hero-bg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const DecoratedBox(
            // Mirrors hero::before's subtle readability gradient overlay.
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x1AF3E6E1), Color(0x03F3F5E1)],
              ),
            ),
            child: SizedBox(width: double.infinity, height: 460),
          ),
        ),
        // Mirrors hero::after's fade into the page background below.
        const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 90,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x00DBD0BC), MammaMindColors.bgMain],
              ),
            ),
          ),
        ),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: kContentMaxWidth),
            child: Padding(
              padding: const EdgeInsets.all(MammaMindSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      'assets/svg/mamma_mind_logo_combined.svg',
                      // Mirrors logo.css: 100px mobile -> 200px desktop
                      // (min-width: 768px), doubled to match the reference.
                      height: MediaQuery.of(context).size.width >= 768
                          ? 220
                          : 110,
                    ),
                  ),
                  const SizedBox(height: MammaMindSpacing.md),
                  Center(
                    child: Text(
                      MammaMindData.heroHeadline,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: MammaMindSpacing.xs),
                  Center(
                    child: Text(
                      MammaMindData.heroLead,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: MammaMindSpacing.lg),
                  Center(
                    child: _HeroScrollIndicator(onTap: onScrollIndicatorTap),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Ports .hero-scroll-indicator: a plain black arrow-down that floats up
/// and down (mirrors the CSS `@keyframes float`) and scrolls to courses.
class _HeroScrollIndicator extends StatefulWidget {
  final VoidCallback onTap;

  const _HeroScrollIndicator({required this.onTap});

  @override
  State<_HeroScrollIndicator> createState() => _HeroScrollIndicatorState();
}

class _HeroScrollIndicatorState extends State<_HeroScrollIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1250),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Respect reduced-motion preference, matching the source CSS's
    // `@media (prefers-reduced-motion: no-preference)` guard on the float.
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Scroll till aktuella kurser',
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _controller.value * 6),
              child: child,
            );
          },
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
            size: 56,
          ),
        ),
      ),
    );
  }
}

class _WhyMammaMindSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Varför MammaMind?',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: MammaMindSpacing.xs),
        for (final p in MammaMindData.whyMammaMindParagraphs)
          Padding(
            padding: const EdgeInsets.only(bottom: MammaMindSpacing.xs),
            child: Text(p, style: Theme.of(context).textTheme.bodyMedium),
          ),
        const SizedBox(height: MammaMindSpacing.xs),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: MammaMindSpacing.md,
            runSpacing: MammaMindSpacing.xs,
            children: [
              _ContactIconLink(
                assetPath: 'assets/svg/instagram-logo.svg',
                label: MammaMindData.instagramHandle,
                onTap: () => launchUrl(Uri.parse(MammaMindData.instagramUrl)),
              ),
              _ContactIconLink(
                assetPath: 'assets/svg/email.svg',
                label: MammaMindData.contactEmail,
                onTap: () => launchUrl(
                  Uri.parse('mailto:${MammaMindData.contactEmail}'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactIconLink extends StatelessWidget {
  final String assetPath;
  final String label;
  final VoidCallback onTap;

  const _ContactIconLink({
    required this.assetPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(assetPath, height: 20, width: 20),
          const SizedBox(width: 6),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final String title;
  final List<String> metaLines;
  final String ctaLabel;
  final VoidCallback onTap;

  const _CourseCard({
    required this.title,
    required this.metaLines,
    required this.ctaLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ponytail: source site's .course-card has no card background at
      // all (transparent, sits directly on the section's page color) -
      // matching that instead of the Card widget's default white fill.
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: MammaMindColors.cardBorder),
        borderRadius: BorderRadius.circular(MammaMindRadius.lg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(MammaMindSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: MammaMindSpacing.xs),
            for (final line in metaLines)
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  '• $line',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            const SizedBox(height: MammaMindSpacing.xs),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: MammaMindColors.accent,
                foregroundColor: MammaMindColors.textWhite,
              ),
              child: Text(ctaLabel),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrentCoursesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Aktuella kurser 2026',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Nya kurstillfällen är planerade till hösten 2026',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: MammaMindColors.textOngoing),
        ),
        const SizedBox(height: MammaMindSpacing.sm),
        _CourseCard(
          title: '🌿 ${MammaMindData.courseTitle}',
          metaLines: [
            'Startdatum: ${MammaMindData.courseSummaryStartDate}',
            MammaMindData.courseSummarySchedule,
            'Plats: ${MammaMindData.courseSummaryLocation}',
            MammaMindData.courseSummarySessions,
          ],
          ctaLabel: 'Läs mer om kursen',
          onTap: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const CourseDetailScreen())),
        ),
      ],
    );
  }
}

class _WorkshopsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Prova på workshop',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Nya workshops är planerade till hösten 2026',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: MammaMindColors.textCompleted),
        ),
        const SizedBox(height: MammaMindSpacing.sm),
        _CourseCard(
          title:
              '${MammaMindData.workshopTitle}: ${MammaMindData.workshopSubtitle}',
          metaLines: [
            'Datum: ${MammaMindData.workshopSummaryDate} 2026',
            'Tid kl. ${MammaMindData.workshopSummaryTime}',
            'Plats: ${MammaMindData.workshopSummaryLocation}',
            'Gratis prova på, anmäl intresse - först till kvarn!',
          ],
          ctaLabel: 'Läs mer om workshopen',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const WorkshopDetailScreen()),
          ),
        ),
      ],
    );
  }
}

class _AboutMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 340),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: MammaMindColors.cardBorder),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/MammaMind_training.jpg',
                  semanticLabel: 'Tara, instruktör för MammaMind',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: MammaMindSpacing.sm),
        // ponytail: source site's mobile layout is column-reverse on the
        // image+text pair, so "Om mig" (part of the text block) lands
        // right before its paragraphs, after the image.
        Text('Om mig', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: MammaMindSpacing.xs),
        for (final p in MammaMindData.aboutMeParagraphs)
          Padding(
            padding: const EdgeInsets.only(bottom: MammaMindSpacing.xs),
            child: Text(p, style: Theme.of(context).textTheme.bodyMedium),
          ),
      ],
    );
  }
}

class _FaqSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Vanliga frågor', style: Theme.of(context).textTheme.titleLarge),
        for (final entry in MammaMindData.faq)
          ExpansionTile(
            title: Text(
              entry.question,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            childrenPadding: const EdgeInsets.only(
              left: MammaMindSpacing.xs,
              right: MammaMindSpacing.xs,
              bottom: MammaMindSpacing.sm,
            ),
            children: [
              for (final p in entry.answerParagraphs)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: MammaMindSpacing.xs),
                    child: Text(
                      p,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class _ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Kontakta mig', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: MammaMindSpacing.xs),
        for (final p in MammaMindData.contactParagraphs)
          Padding(
            padding: const EdgeInsets.only(bottom: MammaMindSpacing.xs),
            child: Text(p, style: Theme.of(context).textTheme.bodyMedium),
          ),
      ],
    );
  }
}
