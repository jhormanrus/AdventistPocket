import 'package:adventist_pocket/config/logger.dart';
import 'package:adventist_pocket/routes/bible_book.dart';
import 'package:adventist_pocket/routes/bible_chapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(observers: [Logger()], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventist Pocket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Home Page'),
      routes: {
        '/bible/book': (context) => const BibleBook(),
        '/bible/book/chapter': (context) => const BibleChapter(),
      },
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/bible/book'),
          child: const Text('Open bible'),
        ),
      ),
    );
  }
}
