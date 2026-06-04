import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/content_container.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'Skills',
              heading: 'Technologies I Use',
            ),
            Column(
              children: [
                for (var i = 0; i < PortfolioData.skillGroups.length; i++) ...[
                  SkillRow(group: PortfolioData.skillGroups[i]),
                  if (i < PortfolioData.skillGroups.length - 1)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 28),
                      child: Divider(color: AppColors.border, height: 1),
                    ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
