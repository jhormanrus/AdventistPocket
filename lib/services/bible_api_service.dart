import 'package:http/http.dart' as http;

class BibleApiService {
  final String baseUrl = 'https://biblia.my.to';

  Future<http.Response> getBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/book'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load books');
    }
  }
}
