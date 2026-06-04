import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/contact_widgets.dart';
import '../widgets/content_container.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.sizeOf(context).width < 768;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.background,
            AppColors.accent.withValues(alpha: 0.06),
          ],
        ),
        border: const Border(
          top: BorderSide(color: AppColors.border, width: 0.5),
        ),
      ),
      child: ContentContainer(
        bottomPadding: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading
            Text(
              "Let's Build Something Together",
              style: theme.textTheme.displaySmall?.copyWith(
                fontSize: isMobile ? 28 : 40,
                textBaseline: TextBaseline.alphabetic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Text(
                'Ready to bring your Flutter app idea to life? '
                "I'm open to full-time roles, freelance projects, "
                'and international remote opportunities.',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),

            // Email button
            ContactEmailButton(),

            const SizedBox(height: 32),

            // Social links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContactSocialButton(
                  icon: FontAwesomeIcons.github,
                  url: PortfolioData.githubUrl,
                  tooltip: 'GitHub',
                ),
                const SizedBox(width: 16),
                ContactSocialButton(
                  icon: FontAwesomeIcons.linkedin,
                  url: PortfolioData.linkedinUrl,
                  tooltip: 'LinkedIn',
                ),
                const SizedBox(width: 16),
                ContactSocialButton(
                  icon: Icons.email_outlined,
                  url: 'mailto:${PortfolioData.email}',
                  tooltip: 'Email',
                  isMaterial: true,
                ),
                if (PortfolioData.resumeUrl.isNotEmpty) ...[
                  const SizedBox(width: 16),
                  ContactSocialButton(
                    icon: Icons.description_outlined,
                    url: PortfolioData.resumeUrl,
                    tooltip: 'Resume',
                    isMaterial: true,
                  ),
                ],
              ],
            ),

            const SizedBox(height: 56),

            // Divider
            Container(height: 0.5, color: AppColors.border),
            const SizedBox(height: 28),

            // Footer row
            Wrap(
              spacing: 24,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  '© 2025 Mariam Elmogy',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary.withValues(alpha: 0.7),
                  ),
                ),
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.textSecondary.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Designed & built with ',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary.withValues(alpha: 0.7),
                      ),
                    ),
                    Text(
                      'Flutter',
                      style: GoogleFonts.inter(
                        color: AppColors.accent.withValues(alpha: 0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
