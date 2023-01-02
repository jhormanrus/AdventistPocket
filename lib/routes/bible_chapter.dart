import 'package:adventist_pocket/models/chapter.dart';
import 'package:adventist_pocket/providers/bible.dart';
import 'package:adventist_pocket/services/bible_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BibleChapter extends ConsumerStatefulWidget {
  const BibleChapter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BibleChapterState();
}

class _BibleChapterState extends ConsumerState<BibleChapter> {
  List<Chapter> _chapters = [];

  @override
  void initState() {
    super.initState();
    String bookId = ref.read(bookProvider.notifier).state;
    BibleApiService().getChapters(bookId).then((chapters) {
      setState(() {
        _chapters = chapters;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapters'),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
          ),
          itemCount: _chapters.length,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  ref.read(chapterProvider.notifier).state = _chapters[index].number;
                  Navigator.pushNamed(context, '/bible/book/chapter/verse');
                },
                child: Center(
                  child: Text(_chapters[index].number),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
