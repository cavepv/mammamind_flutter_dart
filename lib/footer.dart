// Shared footer: ports assets/partials/footer.html (Instagram, email,
// privacy/terms links, copyright), included on every page there via
// includes.js. Privacy/terms subpages aren't part of this port's scope, so
// they show the same inert demo-only message as other backend-bound CTAs.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'demo_action.dart';
import 'mammamind_data.dart';
import 'theme.dart';

class MammaMindFooter extends StatelessWidget {
  const MammaMindFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final linkStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: MammaMindColors.textWhite);

    return Container(
      width: double.infinity,
      color: MammaMindColors.accent,
      padding: const EdgeInsets.symmetric(
        horizontal: MammaMindSpacing.md,
        vertical: MammaMindSpacing.lg,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => launchUrl(Uri.parse(MammaMindData.instagramUrl)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/svg/instagram-logo.svg',
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    MammaMindColors.textWhite,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 6),
                Text('Instagram', style: linkStyle),
              ],
            ),
          ),
          const SizedBox(height: MammaMindSpacing.sm),
          InkWell(
            onTap: () => launchUrl(
                Uri.parse('mailto:${MammaMindData.contactEmail}')),
            child: Text(MammaMindData.contactEmail, style: linkStyle),
          ),
          const SizedBox(height: MammaMindSpacing.sm),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: MammaMindSpacing.md,
            children: [
              InkWell(
                onTap: () => showDemoOnlyMessage(context),
                child: Text(MammaMindData.footerPrivacyLabel, style: linkStyle),
              ),
              InkWell(
                onTap: () => showDemoOnlyMessage(context),
                child: Text(MammaMindData.footerTermsLabel, style: linkStyle),
              ),
            ],
          ),
          const SizedBox(height: MammaMindSpacing.sm),
          Text(
            MammaMindData.footerCopyright,
            style: linkStyle?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
