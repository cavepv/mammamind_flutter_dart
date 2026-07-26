// Workshop detail screen: ports courses/workshop-smartfri-vardag.html.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'demo_banner.dart';
import 'footer.dart';
import 'interest_form.dart';
import 'mammamind_data.dart';
import 'theme.dart';

class WorkshopDetailScreen extends StatelessWidget {
  const WorkshopDetailScreen({super.key});

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
          Padding(
            padding: const EdgeInsets.all(MammaMindSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MammaMindData.workshopTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  MammaMindData.workshopSubtitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: MammaMindSpacing.sm),
                Text(
                  MammaMindData.workshopLead,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: MammaMindSpacing.sm),
                for (final p in MammaMindData.workshopIntroParagraphs)
                  Padding(
                    padding: const EdgeInsets.only(bottom: MammaMindSpacing.xs),
                    child: Text(
                      p,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                for (final area in MammaMindData.workshopFocusAreas)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '• $area',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                const SizedBox(height: MammaMindSpacing.sm),
                for (final p in MammaMindData.workshopClosingParagraphs)
                  Padding(
                    padding: const EdgeInsets.only(bottom: MammaMindSpacing.xs),
                    child: Text(
                      p,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                const SizedBox(height: MammaMindSpacing.sm),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(MammaMindSpacing.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final item in MammaMindData.workshopMeta)
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
                  MammaMindData.workshopCapacityNote,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: MammaMindSpacing.lg),
                const InterestForm(),
              ],
            ),
          ),
          const SizedBox(height: MammaMindSpacing.lg),
          const MammaMindFooter(),
        ],
      ),
    );
  }
}
