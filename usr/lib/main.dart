import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/category_detail_screen.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const KannadaKnowledgeApp());
}

class KannadaKnowledgeApp extends StatelessWidget {
  const KannadaKnowledgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kannada Knowledge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/category': (context) => const CategoryDetailScreen(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}
