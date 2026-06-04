import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/content_container.dart';
import '../widgets/section_title.dart';
import '../widgets/stat_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      color: AppColors.surface,
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(eyebrow: 'About Me', heading: 'Who I Am'),
            isMobile
                ? _buildMobileLayout(context)
                : _buildDesktopLayout(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildBio(context)),
        const SizedBox(width: 60),
        Expanded(flex: 2, child: _buildStats(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBio(context),
        const SizedBox(height: 40),
        _buildStats(context),
      ],
    );
  }

  Widget _buildBio(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Passionate about crafting mobile experiences that matter.',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: AppColors.textPrimary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'I\'m a Flutter developer with 2+ years building and shipping '
          'cross-platform mobile apps. Currently at Leggera Techs, I own four '
          'production apps end-to-end — from architecture decisions and feature '
          'development through to App Store and Google Play release.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'I care deeply about clean architecture, maintainable code, and '
          'building apps that feel great to use. Whether it\'s a real-time '
          'robot interaction over MQTT, in-app subscription flows, or a '
          'white-label multi-flavor build — I enjoy the full complexity of '
          'the Flutter ecosystem.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Open to local, remote, and international opportunities.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.accent.withValues(alpha: 0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStats(BuildContext context) {
    return Column(
      children: [
        StatCard(value: '2+', label: 'Years Experience'),
        const SizedBox(height: 16),
        StatCard(value: '6', label: 'Apps Shipped'),
      ],
    );
  }
}
