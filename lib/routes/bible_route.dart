import 'package:adventist_pocket/models/book.dart';
import 'package:adventist_pocket/services/bible_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BibleRoute extends ConsumerStatefulWidget {
  const BibleRoute({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BibleRouteState();
}

class _BibleRouteState extends ConsumerState<BibleRoute> {
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
      body: Center(
        child: ListView(
          children: _books.map((book) => Text(book.name)).toList(),
        ),
      ),
    );
  }
}
