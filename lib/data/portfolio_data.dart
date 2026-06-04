import 'package:mariam_portfolio/utils/pdf_data.dart';

enum ProjectStatus { live, production, freelance, openSource }

class Project {
  final String title;
  final ProjectStatus status;
  final String description;
  final List<String> techTags;
  final String? imageUrl;
  final String? assetImagePath;
  final List<String> screenshotUrls;
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
    this.assetImagePath,
    this.screenshotUrls = const [],
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
  final String? description;

  const Education({
    required this.degree,
    required this.institution,
    required this.period,
    this.detail,
    this.description,
  });
}

class Certification {
  final String title;
  final String issuer;
  final String year;
  final List<String> bullets;

  const Certification({
    required this.title,
    required this.issuer,
    required this.year,
    this.bullets = const [],
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
        'Designed and delivered a summer Flutter training program for college students covering Dart fundamentals, state management, REST API integration, and end-to-end app development.',
        'Structured sessions progressing from core Dart and widget basics through BLoC/Cubit, navigation, and live project build.',
        'Guided students in building and running their own Flutter apps by the end of the program.',
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
      screenshotUrls: [
        'https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/ed/30/f8/'
            'ed30f869-d18a-4100-da10-a47a09267885/app-1.png/392x696bb.jpg',
        'https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/62/f4/a9/'
            '62f4a9e1-9994-c378-ee82-c364c09e9f30/app-2.png/392x696bb.jpg',
        'https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/11/f2/3f/'
            '11f23f79-422e-3116-2945-c6fa2ff3c432/app-3.png/392x696bb.jpg',
      ],
      appStoreUrl: 'https://apps.apple.com/eg/app/misimu/id6745457448',
    ),
    Project(
      title: 'White-Label Laboratory App',
      status: ProjectStatus.production,
      description:
          'Two companion apps — one for chemists and one for customers — built from a single '
          'codebase using Flutter flavors, with a configurable white-labelling system that lets '
          'each lab brand both apps independently.',
      techTags: ['Flutter', 'Dart', 'Flavors', 'REST APIs', 'White-Label'],
      screenshotUrls: [
        'assets/images/lab_chemist_home.png',
        'assets/images/lab_customer_home.png',
        'assets/images/lab_customer_screen.png',
      ],
    ),
    Project(
      title: 'Ebook & Audiobook Platform',
      status: ProjectStatus.production,
      description:
          'A reading and listening app where users buy books or subscribe to plans, '
          'with an in-app book reader, in-app purchases, subscriptions, and audio playback.',
      techTags: [
        'Flutter',
        'Dart',
        'Book Reader',
        'In-App Purchases',
        'Subscriptions',
        'Audio Playback',
      ],
      screenshotUrls: [
        'assets/images/audio_page.png',
        'assets/images/book_home.png',
        'assets/images/book_detail.png',
      ]
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
      screenshotUrls: [
        'https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/7b/81/0d/'
            '7b810d89-353b-c38a-c180-67af5a6ea46d/0.jpg/392x696bb.jpg',
        'https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/fa/f4/0e/'
            'faf40e26-2ea8-7933-ae34-5e2d73eb051b/2.png/392x696bb.jpg',
        'https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/85/d6/dd/'
            '85d6dd9c-9193-30a1-3b0d-2c3753a40f7a/4.png/392x696bb.jpg',
      ],
      appStoreUrl: 'https://apps.apple.com/eg/app/selsal/id6744387094',
    ),
    Project(
      title: 'Stretchout — Wellness App',
      status: ProjectStatus.freelance,
      description:
          'A wellness app that reminds remote workers to stretch, with scheduled '
          'reminders, stretch categories, and guided movement instructions with countdown timers.',
      techTags: ['Flutter', 'Dart', 'Provider', 'Local Notifications'],
      screenshotUrls: [
        'assets/images/stretchout_home.png',
        'assets/images/stretchout_categories.png',
        'assets/images/stretchout_exercise.png',
      ],
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
      screenshotUrls: [
        'assets/images/alef_home.png',
        'assets/images/alef_arabic.png',
        'assets/images/alef_controller.png',
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
    SkillGroup(
      title: 'Teaching & Training',
      skills: [
        'Flutter Instruction',
        'Curriculum Design',
        'Technical Mentoring',
        'AI / ML Education',
        'Project-Based Learning',
      ],
    ),
  ];

  static const education = <Education>[
    Education(
      degree: 'BSc Computer Science (Dual Degree)',
      institution:
          'Arab Academy for Science & Technology, Egypt · University of Northampton, UK',
      period: '2019 – 2023',
      detail: 'GPA 3.61 · First-Class Honours',
    ),
    Education(
      degree: 'Graduation Project — Intelligent Personal Assistant for Disabled (IPAD)',
      institution: 'Arab Academy for Science & Technology',
      period: '2023',
      detail: 'Grade A+',
      description:
          'Developed a Flutter app aiding blind and deaf users, featuring a Smart Glove '
          'for sign language-to-text translation and an ESP32 Cam for real-time object recognition.',
    ),
  ];

  static const certifications = <Certification>[
    Certification(
      title: 'Mobile Development Internship',
      issuer: 'DEPI — Digital Egypt Pioneers Initiative · Alexandria',
      year: 'Apr – Dec 2024',
    ),
    Certification(
      title: 'Flutter Development Diploma',
      issuer: 'AMIT · Alexandria',
      year: 'Mar – Jul 2023',
      bullets: [
        'Enhanced problem-solving skills and acquired proficiency in Dart.',
        'Proficient in testing and debugging, integrating local databases and Firebase for real-time data and user management.',
        'Utilized REST API integration for seamless external data communication in Flutter.',
        'Experienced in creating animations for enhancing user interfaces.',
        'Translated and built designs into responsive UI code from Adobe XD and Figma.',
      ],
    ),
    Certification(
      title: 'Flutter Payment Integration: Stripe & PayPal',
      issuer: 'Udemy',
      year: 'Apr – Jul 2024',
      bullets: [
        'Practical implementation of integrating Stripe and PayPal payments.',
        'Understanding the differences between payment gateways and in-app purchases.',
        'Choosing the right payment gateway for Flutter applications.',
      ],
    ),
    Certification(
      title: 'Mastering Flutter: Responsive & Adaptive UI Design',
      issuer: 'Udemy',
      year: 'Jan – Mar 2024',
      bullets: [
        'Responsive and Adaptive UI design concepts including widgets, best practices, and performance optimization.',
        'Built a real-world project to apply learnings.',
      ],
    ),
    Certification(
      title: 'Flutter Advanced Course — BLoC & MVVM Pattern',
      issuer: 'Udemy',
      year: 'Jan – Feb 2024',
      bullets: [
        'Deep dive into BLoC core concepts: cubits, blocs, events, and local/global access patterns.',
        'Adopted the MVVM design pattern for clean separation of UI, business logic, and data layers.',
      ],
    ),
  ];

  static const awards = <String>[
    'MATE ROV Competition — Best Engineering Presentation Award (2022)',
    'MATE ROV Competition — Best Programming & Image Processing Award (2022)',
  ];
}
