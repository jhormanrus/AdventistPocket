import 'package:adventist_pocket/models/book.dart';
import 'package:adventist_pocket/models/chapter.dart';
import 'package:http/http.dart' as http;

class BibleApiService {
  final String baseUrl = 'https://biblia.my.to';

  Future<List<Book>> getBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/book'));
    if (response.statusCode == 200) {
      return bookFromJson(response.body);
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<List<Chapter>> getChapters(String bookId) async {
    final response = await http.get(Uri.parse('$baseUrl/book/$bookId/chapter'));
    if (response.statusCode == 200) {
      return chapterFromJson(response.body);
    } else {
      throw Exception('Failed to load chapters');
    }
  }
}
