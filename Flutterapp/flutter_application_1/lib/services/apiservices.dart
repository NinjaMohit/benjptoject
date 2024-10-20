import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:3000/api/v1';

  // Directly use the provided Bearer token
  final String _apiToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjExMiwiZW1haWwiOiJzYXR5YW1yaWd0ZWFtQGdtYWlsLmNvbSIsImlhdCI6MTcyNjk0NzE3NX0.hW1XjBwuH8wGJLxBltB3Qi4tFBX_Jux6Y2ahoKKD5f4';

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiToken',
    };
  }

  Future<List<dynamic>?> fetchCertificates() async {
    final url = Uri.parse(
        '$_baseUrl/frameworks/getCertificates'); // Updated endpoint for fetching certificates
    try {
      final response = await http.get(url, headers: _getHeaders());
      if (response.statusCode == 200) {
        return jsonDecode(
            response.body); // Return the list of certificates if successful
      } else {
        log('Failed to load data from API: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      log('Error in API call: $e');
    }
    return null; // Return null if there was an error
  }
}
