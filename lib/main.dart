import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/industry_section.dart';
import 'sections/course_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';
import 'widgets/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wind Energy Training Institute',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0D47A1), // Deep blue
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1),
          secondary: const Color(0xFF4CAF50), // Green
        ),
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey industryKey = GlobalKey();
  final GlobalKey courseKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: heroKey),
                AboutSection(key: aboutKey),
                IndustrySection(key: industryKey),
                CourseSection(key: courseKey),
                ContactSection(key: contactKey),
                const FooterSection(),
              ],
            ),
          ),
          CustomNavigationBar(
            onNavigate: (section) {
              switch (section) {
                case 'home':
                  scrollToSection(heroKey);
                  break;
                case 'about':
                  scrollToSection(aboutKey);
                  break;
                case 'industry':
                  scrollToSection(industryKey);
                  break;
                case 'course':
                  scrollToSection(courseKey);
                  break;
                case 'contact':
                  scrollToSection(contactKey);
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
