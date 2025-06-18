import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_web_app/pages/about/about_page.dart';
import 'package:test_web_app/pages/home/home_page.dart';
import 'package:test_web_app/pages/career/career_page.dart';
import 'package:test_web_app/pages/contact/contact_page.dart';

void main() {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomePage()),
      GoRoute(path: '/career', builder: (context, state) => CareerPage()),
      GoRoute(path: '/contact', builder: (context, state) => ContactPage()),
      GoRoute(path: '/about', builder: (context, state) => AboutPage()),
    ],
  );

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF143A52),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.gruppoTextTheme(),
        scaffoldBackgroundColor: Color(0xFFE3EFF3).withOpacity(0.3),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFF6E828A),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: Color(0xFF143A52),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
