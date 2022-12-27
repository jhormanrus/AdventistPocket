import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://www.example.com/api';

  Future<http.Response> getData() async {
    final response = await http.get(Uri.parse('$baseUrl/data'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
