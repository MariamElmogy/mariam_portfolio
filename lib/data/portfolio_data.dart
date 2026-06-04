import 'package:mariam_portfolio/utils/pdf_data.dart';

enum ProjectStatus { live, production, freelance, openSource }

class Project {
  final String title;
  final ProjectStatus status;
  final String description;
  final List<String> techTags;
  final String? imageUrl;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final String? githubUrl;
  final String? websiteUrl;

  bool get hasLinks =>
      appStoreUrl != null ||
      playStoreUrl != null ||
      githubUrl != null ||
      websiteUrl != null;

  const Project({
    required this.title,
    required this.status,
    required this.description,
    required this.techTags,
    this.imageUrl,
    this.appStoreUrl,
    this.playStoreUrl,
    this.githubUrl,
    this.websiteUrl,
  });
}

class WorkExperience {
  final String role;
  final String company;
  final String location;
  final String period;
  final String summary;
  final List<String> bullets;
  final bool isCurrent;

  const WorkExperience({
    required this.role,
    required this.company,
    required this.location,
    required this.period,
    required this.summary,
    this.bullets = const [],
    this.isCurrent = false,
  });
}

class Education {
  final String degree;
  final String institution;
  final String period;
  final String? detail;

  const Education({
    required this.degree,
    required this.institution,
    required this.period,
    this.detail,
  });
}

class Certification {
  final String title;
  final String issuer;
  final String year;

  const Certification({
    required this.title,
    required this.issuer,
    required this.year,
  });
}

class SkillGroup {
  final String title;
  final List<String> skills;

  const SkillGroup({required this.title, required this.skills});
}

class PortfolioData {
  PortfolioData._();

  static const email = 'Mariamelmogy3@gmail.com';
  static const whatsappNumber = '+201XXXXXXXXX'; // replace with real number
  static const githubUrl = 'https://github.com/MariamElmogy';
  static const linkedinUrl = 'https://www.linkedin.com/in/mariam-elmogy/';
  static const resumeUrl = PdfData.pdfUrl;

  static const experiences = <WorkExperience>[
    WorkExperience(
      role: 'Flutter Developer',
      company: 'Leggera Techs',
      location: 'Remote',
      period: 'Mar 2025 – Present',
      summary:
          'Flutter developer owning four production apps end-to-end: '
          'architecture, development, testing, and App Store / Google Play release.',
      bullets: [
        'Built and launched Misimu, a live e-commerce app on the App Store, covering product browsing, cart, and checkout.',
        'Developed a white-label laboratory app for chemists and customers with a configurable white-labelling system and custom flavors module.',
        'Built an ebook and audiobook platform with in-app purchases and subscription plans for one-time purchase and subscriber access.',
        'Partnered with the QA team across testing phases to stabilize releases before each launch.',
        'Delivered a Flutter course as a summer training for college students, covering Flutter fundamentals and hands-on app development.',
      ],
      isCurrent: true,
    ),
    WorkExperience(
      role: 'Freelance Flutter Developer',
      company: 'Self-employed',
      location: 'Remote',
      period: 'Apr 2025 – Oct 2025',
      summary:
          'Designed and shipped two client apps independently, covering the full '
          'development lifecycle from architecture to release.',
      bullets: [
        'Built Stretchout, a stretch-reminder app for remote workers with scheduled reminders and guided movement instructions.',
        'Designed and shipped Selsal, a real estate app for the KSA market that lets buyers track construction and handover progress on their properties.',
      ],
    ),
    WorkExperience(
      role: 'AI Instructor',
      company: 'iSchool',
      location: 'Project-based',
      period: 'Nov 2024 – Jan 2025',
      summary:
          'Designed and delivered a hands-on AI curriculum for students aged 13–18, '
          'covering core machine learning concepts and real-world applications.',
      bullets: [
        'Taught classes of up to 20 students, translating complex AI topics into clear, project-based lessons.',
        'Designed lesson plans covering supervised learning, neural networks, computer vision, and NLP basics.',
        'Guided students through building mini AI projects using Python and beginner-friendly tools.',
        'Received strong engagement and positive feedback; several students continued into independent AI projects.',
      ],
    ),
    WorkExperience(
      role: 'Flutter Developer',
      company: 'Pyramakerz Tech',
      location: 'Alexandria, Egypt',
      period: 'Jan 2024 – Jul 2024',
      summary:
          'Built a Flutter educational app for children aged 3–6, connected to a '
          'physical robot over MQTT, using Firebase, MVVM, and Cubit.',
      bullets: [
        'Integrated Firebase for authentication, cloud data storage, and daily push notifications.',
        'Architected the app with MVVM and Cubit for clean separation of UI, business logic, and data layers.',
        'Collaborated with designers to translate Figma designs into responsive UI, and optimized performance ahead of release.',
      ],
    ),
    WorkExperience(
      role: 'Software Engineer → CTO',
      company: 'ROV Student Team',
      location: 'Alexandria, Egypt',
      period: 'Jan 2021 – Aug 2022',
      summary:
          'Promoted to CTO; developed image-processing software for underwater '
          'navigation and a VR demo in Unity for the MATE ROV competition.',
      bullets: [
        'Reported to CTO of the robotics team after completing the software training track.',
        'Developed image-processing software for underwater ROV navigation.',
        'Built a VR demo of the ROV in Unity.',
        'Contributed to the team\'s bonus achievement at the MATE ROV international competition.',
      ],
    ),
  ];

  static const projects = <Project>[
    Project(
      title: 'Misimu — E-commerce App',
      status: ProjectStatus.live,
      description:
          'A cross-platform e-commerce app with product browsing, cart, and checkout. '
          'Built and launched end-to-end as the Flutter developer.',
      techTags: ['Flutter', 'Dart', 'BLoC/Cubit', 'REST APIs', 'Firebase'],
      imageUrl:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/78/7d/fa/'
          '787dfa6c-07c4-5b3a-0cee-f137ad3e6e2b/'
          'AppIcon-0-0-1x_U007emarketing-0-11-0-85-220.png/512x512bb.jpg',
      appStoreUrl: 'https://apps.apple.com/eg/app/misimu/id6745457448',
    ),
    Project(
      title: 'White-Label Laboratory App',
      status: ProjectStatus.production,
      description:
          'A configurable white-label app for chemists and customers, supporting '
          'multiple branded builds from a single codebase using Flutter flavors.',
      techTags: ['Flutter', 'Dart', 'Flavors', 'REST APIs', 'White-Label'],
    ),
    Project(
      title: 'Ebook & Audiobook Platform',
      status: ProjectStatus.production,
      description:
          'A reading and listening app where users buy books or subscribe to plans, '
          'with in-app purchases, subscriptions, and audio playback.',
      techTags: [
        'Flutter',
        'Dart',
        'In-App Purchases',
        'Subscriptions',
        'Audio Playback',
      ],
    ),
    Project(
      title: 'Selsal — Real Estate App',
      status: ProjectStatus.freelance,
      description:
          'A real estate app for the KSA market that lets buyers track construction '
          'and handover progress on their properties in real time.',
      techTags: ['Flutter', 'Dart', 'REST APIs'],
      imageUrl:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/29/82/22/'
          '2982223a-f092-969e-3c99-514c1347949b/'
          'AppIcon-0-1x_U007emarketing-0-11-0-0-85-220-0.png/512x512bb.jpg',
      appStoreUrl: 'https://apps.apple.com/eg/app/selsal/id6744387094',
      playStoreUrl: '',
    ),
    Project(
      title: 'Stretchout — Wellness App',
      status: ProjectStatus.freelance,
      description:
          'A wellness app that reminds remote workers to stretch, with scheduled '
          'reminders and guided movement instructions.',
      techTags: ['Flutter', 'Dart', 'Provider', 'Local Notifications'],
    ),
    Project(
      title: "Children's Educational App",
      status: ProjectStatus.production,
      description:
          'A Flutter app for children aged 3–6 teaching Arabic/English phonics and '
          'math, connected to a physical robot over MQTT for real-time interaction.',
      techTags: [
        'Flutter',
        'Dart',
        'Firebase',
        'MQTT',
        'MVVM',
        'Cubit',
        'Push Notifications',
      ],
    ),
  ];

  static const skillGroups = <SkillGroup>[
    SkillGroup(title: 'Languages', skills: ['Dart', 'Python', 'Java']),
    SkillGroup(
      title: 'Mobile & Flutter',
      skills: [
        'Flutter',
        'BLoC / Cubit',
        'Riverpod',
        'Provider',
        'Firebase',
        'Supabase',
        'REST APIs',
        'GraphQL',
        'MQTT',
        'In-App Purchases',
        'Push Notifications',
        'Hive',
        'Isar',
        'Animations',
        'Responsive UI',
        'Localization (AR/EN)',
        'White-labelling',
      ],
    ),
    SkillGroup(
      title: 'Architecture',
      skills: ['Clean Architecture', 'MVVM', 'SOLID', 'OOP'],
    ),
    SkillGroup(
      title: 'Tools & Delivery',
      skills: [
        'Git',
        'GitHub',
        'Postman',
        'Android Studio',
        'VS Code',
        'App Store Deployment',
        'Google Play Deployment',
      ],
    ),
  ];

  static const education = <Education>[
    Education(
      degree: 'BSc Computer Science (Dual Degree)',
      institution:
          'Arab Academy for Science & Technology, Egypt · University of Northampton, UK',
      period: '2019 – 2023',
      detail: 'GPA 3.61/4.0 · First-Class Honours',
    ),
  ];

  static const certifications = <Certification>[
    Certification(
      title: 'Mobile Application Development',
      issuer: 'DEPI — Digital Egypt Pioneers Initiative',
      year: '2024',
    ),
    Certification(
      title: 'Flutter Development Diploma',
      issuer: 'AMIT, Alexandria',
      year: '2023',
    ),
  ];

  static const awards = <String>[
    'MATE ROV Competition — Best Engineering Presentation; Best Programming & Image Processing (2022)',
  ];
}
