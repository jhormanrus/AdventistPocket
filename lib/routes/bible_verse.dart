import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BibleVerse extends ConsumerStatefulWidget {
  const BibleVerse({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BibleVerseState();
}

class _BibleVerseState extends ConsumerState<BibleVerse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verses'),
      ),
      body: const Center(
        child: Text('Verses'),
      ),
    );
  }
}
