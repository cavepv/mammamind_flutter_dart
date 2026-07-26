// Landing screen: ports mammamind.se's index.html sections (hero, why,
// courses, workshops, about-me, FAQ, contact) into one scrollable screen.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'course_detail_screen.dart';
import 'demo_banner.dart';
import 'mammamind_data.dart';
import 'theme.dart';
import 'workshop_detail_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MammaMindPage(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: MammaMindSpacing.md,
          vertical: MammaMindSpacing.md,
        ),
        children: [
          _Hero(),
          const SizedBox(height: MammaMindSpacing.lg),
          _WhyMammaMindSection(),
          const _Divider(),
          _CurrentCoursesSection(),
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
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: MammaMindSpacing.md),
      child: Divider(color: MammaMindColors.cardBorder),
    );
  }
}

class _Hero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svg/mamma_mind_logo_combined.svg',
          height: 140,
        ),
        const SizedBox(height: MammaMindSpacing.sm),
        Text(
          MammaMindData.heroHeadline,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: MammaMindSpacing.xs),
        Text(
          MammaMindData.heroLead,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _WhyMammaMindSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Varför MammaMind?', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: MammaMindSpacing.xs),
        for (final p in MammaMindData.whyMammaMindParagraphs)
          Padding(
            padding: const EdgeInsets.only(bottom: MammaMindSpacing.xs),
            child: Text(p, style: Theme.of(context).textTheme.bodyMedium),
          ),
        const SizedBox(height: MammaMindSpacing.xs),
        Wrap(
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
              onTap: () =>
                  launchUrl(Uri.parse('mailto:${MammaMindData.contactEmail}')),
            ),
          ],
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
    return Card(
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
                child: Text('• $line',
                    style: Theme.of(context).textTheme.bodyMedium),
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
        Text('Aktuella kurser 2026',
            style: Theme.of(context).textTheme.titleLarge),
        Text(
          'Nya kurstillfällen är planerade till hösten 2026',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: MammaMindColors.textOngoing),
        ),
        const SizedBox(height: MammaMindSpacing.sm),
        Text('🌿 ${MammaMindData.courseTitle}',
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: MammaMindSpacing.xs),
        _CourseCard(
          title: MammaMindData.courseTitle,
          metaLines: [
            'Startdatum: ${MammaMindData.courseSummaryStartDate}',
            MammaMindData.courseSummarySchedule,
            'Plats: ${MammaMindData.courseSummaryLocation}',
            MammaMindData.courseSummarySessions,
          ],
          ctaLabel: 'Läs mer om kursen',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const CourseDetailScreen()),
          ),
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
        Text('Prova på workshop', style: Theme.of(context).textTheme.titleLarge),
        Text(
          'Nya workshops är planerade till hösten 2026',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: MammaMindColors.textCompleted),
        ),
        const SizedBox(height: MammaMindSpacing.sm),
        Text(
          '${MammaMindData.workshopTitle}: ${MammaMindData.workshopSubtitle}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: MammaMindSpacing.xs),
        _CourseCard(
          title: MammaMindData.workshopTitle,
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
        Text('Om mig', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: MammaMindSpacing.xs),
        ClipRRect(
          borderRadius: BorderRadius.circular(MammaMindRadius.md),
          child: Image.asset(
            'assets/images/MammaMind_training.jpg',
            semanticLabel: 'Tara, instruktör för MammaMind',
          ),
        ),
        const SizedBox(height: MammaMindSpacing.sm),
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
            title: Text(entry.question,
                style: Theme.of(context).textTheme.bodyLarge),
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
                    child:
                        Text(p, style: Theme.of(context).textTheme.bodyMedium),
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
