import 'package:adventist_pocket/models/book.dart';
import 'package:adventist_pocket/providers/bible.dart';
import 'package:adventist_pocket/services/bible_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BibleBook extends ConsumerStatefulWidget {
  const BibleBook({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BibleBookState();
}

class _BibleBookState extends ConsumerState<BibleBook> {
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    BibleApiService().getBooks().then((books) {
      setState(() {
        _books = books;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _books.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_books[index].name),
              onTap: () {
                ref.read(bookProvider.notifier).state = _books[index].id;
                Navigator.pushNamed(context, '/bible/book/chapter');
              },
            );
          },
        ),
      ),
    );
  }
}
