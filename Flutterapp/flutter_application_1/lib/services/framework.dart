import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://localhost:3000/api/v1';

  Future<List<dynamic>> fetchCertificates() async {
    final url = Uri.parse('$baseUrl/frameworks/getCertificates');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load certificates');
    }
  }
}
