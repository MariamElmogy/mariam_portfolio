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
            const SectionTitle(
              eyebrow: 'About Me',
              prefix: 'Who I',
              highlight: 'Am',
              subtitle:
                  'Passionate about crafting mobile experiences that matter.',
            ),
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
        const _ProfilePhoto(),
        const SizedBox(width: 52),
        Expanded(child: _buildContent(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(child: _ProfilePhoto(mobile: true)),
        const SizedBox(height: 36),
        _buildContent(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter Developer',
          style: TextStyle(fontFamily: 'Poppins',
            color: AppColors.accent,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text('Mariam Elmogy', style: theme.textTheme.headlineLarge),
        const SizedBox(height: 20),
        Text(
          'Flutter developer with 2+ years building and shipping '
          'cross-platform mobile apps. Currently at Leggera Techs, I own '
          'four production apps end-to-end — from architecture decisions '
          'and feature development through to App Store and Google Play release.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 14),
        Text(
          'I care deeply about clean architecture, maintainable code, and '
          'building apps that feel great to use. Whether it\'s real-time '
          'robot interaction over MQTT, in-app subscriptions, or a '
          'white-label multi-flavor build — I enjoy the full depth of '
          'the Flutter ecosystem.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 32),
        // Stats side by side
        Row(
          children: [
            Expanded(
              child: StatCard(value: '2+', label: 'Years Experience'),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: StatCard(value: '6', label: 'Apps Shipped'),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfilePhoto extends StatelessWidget {
  final bool mobile;
  const _ProfilePhoto({this.mobile = false});

  @override
  Widget build(BuildContext context) {
    final w = mobile ? 140.0 : 220.0;
    final h = mobile ? 160.0 : 280.0;

    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accent.withValues(alpha: 0.12),
            AppColors.cyan.withValues(alpha: 0.08),
          ],
        ),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/me.jpg',
          fit: BoxFit.cover,
          errorBuilder: (_, e, s) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: mobile ? 56 : 72,
                height: mobile ? 56 : 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accent.withValues(alpha: 0.1),
                  border: Border.all(
                    color: AppColors.accent.withValues(alpha: 0.25),
                  ),
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: mobile ? 32 : 42,
                  color: AppColors.accent.withValues(alpha: 0.4),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '[Profile Photo]',
                style: TextStyle(fontFamily: 'Inter',
                  color: AppColors.textSecondary.withValues(alpha: 0.5),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
