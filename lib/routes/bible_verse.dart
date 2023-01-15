import 'package:adventist_pocket/models/verse.dart';
import 'package:adventist_pocket/services/bible_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BibleVerse extends ConsumerStatefulWidget {
  const BibleVerse({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BibleVerseState();
}

class _BibleVerseState extends ConsumerState<BibleVerse> {
  final ScrollController _scrollController = ScrollController();
  List<Verse> _verses = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo(1000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verses'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 100,
        itemBuilder: (context, index) {
          print(index);
          // BibleApiService().getVerse('PSA', '119', '${index + 1}').then((verse) {
          //   print(verse[0].content);
          // });
          return ListTile(
            title: Text('Verse $index'),
          );
        },
      ),
    );
  }
}
