import 'package:adventist_pocket/models/book.dart';
import 'package:adventist_pocket/models/chapter.dart';
import 'package:adventist_pocket/models/verse.dart';
import 'package:http/http.dart' as http;

class BibleApiService {
  final String baseUrl = 'https://biblia.my.to';

  Future<List<Book>> getBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/book'));
    if (response.statusCode == 200) {
      return booksFromJson(response.body);
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<List<Chapter>> getChapters(String bookId) async {
    final response = await http.get(Uri.parse('$baseUrl/book/$bookId/chapter'));
    if (response.statusCode == 200) {
      return chaptersFromJson(response.body);
    } else {
      throw Exception('Failed to load chapters');
    }
  }

  Future<List<Verse>> getVerses(String bookId, String chapterId) async {
    final response = await http.get(Uri.parse('$baseUrl/book/$bookId/chapter/$chapterId/verse'));
    if (response.statusCode == 200) {
      return versesFromJson(response.body);
    } else {
      throw Exception('Failed to load verses');
    }
  }

  Future<Verse> getVerse(String bookId, String chapterId, String verseId) async {
    final response = await http.get(Uri.parse('$baseUrl/book/$bookId/chapter/$chapterId/verse/$verseId'));
    if (response.statusCode == 200) {
      return verseFromJson(response.body);
    } else {
      throw Exception('Failed to load verse');
    }
  }
}
