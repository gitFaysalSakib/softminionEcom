import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://shopsmama.com/wp-json/wc/v3/products';

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization':
            'Basic Y2tfMWU4ZjNiOTRmNmExNTlhODBjOWFjOTI4MjkyNzI5YTI4ODNjMGRlZDpjc18zZDFlYzRmZDc3ZDQyZjkyOWRjZjUxMGFjMzM4Mjg3ZDdkMGMwNjZj',
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(response.statusCode);
      return data is List ? data : [];
    } else {
      print('Failed to load data: ${response.statusCode}');
      print('Response: ${response.body}');
      return [];
    }
  }
}
