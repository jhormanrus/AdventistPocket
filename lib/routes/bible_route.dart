import 'package:adventist_pocket/services/bible_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BibleRoute extends ConsumerStatefulWidget {
  const BibleRoute({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BibleRouteState();
}

class _BibleRouteState extends ConsumerState<BibleRoute> {
  @override
  void initState() {
    super.initState();
    BibleApiService().getBooks().then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('xde'),
      ),
    );
  }
}
