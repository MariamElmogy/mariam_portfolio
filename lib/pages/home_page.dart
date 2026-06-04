import 'package:flutter/material.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../sections/work_experience_section.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/scroll_reveal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollNotifier = ValueNotifier<double>(0);
  final _aboutKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0.0,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          NavBar(
            onHeroTap: _scrollToTop,
            onAboutTap: () => _scrollTo(_aboutKey),
            onExperienceTap: () => _scrollTo(_experienceKey),
            onProjectsTap: () => _scrollTo(_projectsKey),
            onSkillsTap: () => _scrollTo(_skillsKey),
            onContactTap: () => _scrollTo(_contactKey),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (n) {
                _scrollNotifier.value = _scrollController.offset;
                return false;
              },
              child: ScrollRevealScope(
                notifier: _scrollNotifier,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const HeroSection(),
                      ScrollReveal(
                        delay: const Duration(milliseconds: 0),
                        child: AboutSection(key: _aboutKey),
                      ),
                      ScrollReveal(
                        delay: const Duration(milliseconds: 80),
                        child: WorkExperienceSection(key: _experienceKey),
                      ),
                      ScrollReveal(
                        delay: const Duration(milliseconds: 0),
                        child: ProjectsSection(key: _projectsKey),
                      ),
                      ScrollReveal(
                        delay: const Duration(milliseconds: 0),
                        child: SkillsSection(key: _skillsKey),
                      ),
                      ScrollReveal(
                        delay: const Duration(milliseconds: 0),
                        child: ContactSection(key: _contactKey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
