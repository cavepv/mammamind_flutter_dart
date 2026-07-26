// Course detail screen: ports courses/trygg-aterstart-for-mammor.html.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'demo_action.dart';
import 'demo_banner.dart';
import 'footer.dart';
import 'interest_form.dart';
import 'mammamind_data.dart';
import 'theme.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MammaMindPage(
      appBar: AppBar(
        backgroundColor: MammaMindColors.bgSoft,
        leading: const BackButton(),
        title: SvgPicture.asset(
          'assets/svg/mamma_mind_logo_combined.svg',
          height: 32,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: kContentMaxWidth),
              child: Padding(
                padding: const EdgeInsets.all(MammaMindSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MammaMindData.courseTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: MammaMindSpacing.sm),
                    Text(
                      MammaMindData.courseLead,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: MammaMindSpacing.xs),
                    for (final area in MammaMindData.courseFocusAreas)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '• $area',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    const SizedBox(height: MammaMindSpacing.sm),
                    Text(
                      MammaMindData.courseBabyNote,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: MammaMindSpacing.sm),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(MammaMindSpacing.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final item in MammaMindData.courseMeta)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${item.label}: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: item.value),
                                    ],
                                  ),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: MammaMindSpacing.sm),
                    Text(
                      MammaMindData.courseClosing,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: MammaMindSpacing.xs),
                    Text(
                      'Till alla som bokar bjuder vi på:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '• ${MammaMindData.courseEarlyBirdNote}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: MammaMindSpacing.xs),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Pris: '),
                          TextSpan(
                            text: '${MammaMindData.coursePriceSek} kr. ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: MammaMindData.coursePriceNote),
                        ],
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: MammaMindSpacing.md),
                    ElevatedButton(
                      onPressed: () => showDemoOnlyMessage(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MammaMindColors.accent,
                        foregroundColor: MammaMindColors.textWhite,
                      ),
                      child: Text(
                        'Köp plats – ${MammaMindData.coursePriceSek} kr',
                      ),
                    ),
                    const SizedBox(height: MammaMindSpacing.lg),
                    const InterestForm(),
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
