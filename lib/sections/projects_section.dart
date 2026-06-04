import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/content_container.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = Responsive.projectCrossAxisCount(context);

    return Container(
      color: AppColors.surface,
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'My Projects',
              prefix: "What I've",
              highlight: 'Built',
              subtitle: 'A selection of mobile apps I\'ve shipped.',
            ),
            _ProjectGrid(
              projects: PortfolioData.projects,
              crossAxisCount: crossAxisCount,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  final List<Project> projects;
  final int crossAxisCount;

  const _ProjectGrid({
    required this.projects,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < projects.length; i += crossAxisCount) {
      final rowItems = projects.skip(i).take(crossAxisCount).toList();
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var j = 0; j < rowItems.length; j++) ...[
                if (j > 0) const SizedBox(width: 20),
                Expanded(child: ProjectCard(project: rowItems[j])),
              ],
              for (var k = rowItems.length; k < crossAxisCount; k++) ...[
                const SizedBox(width: 20),
                const Expanded(child: SizedBox()),
              ],
            ],
          ),
        ),
      );
      if (i + crossAxisCount < projects.length) {
        rows.add(const SizedBox(height: 20));
      }
    }

    return Column(children: rows);
  }
}
