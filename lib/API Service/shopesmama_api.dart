// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:softminion/Ssystem_Architecture/Model/shopes_mama_model.dart';

// class ApiService {
//   final String baseUrl = 'https://shopsmama.com/wp-json/wc/v3/products';

//   Future<List<ShopesMamaModel>> fetchData() async {
//     final response = await http.get(
//       Uri.parse(baseUrl),
//       headers: {
//         'Authorization':
//             'Basic Y2tfMWU4ZjNiOTRmNmExNTlhODBjOWFjOTI4MjkyNzI5YTI4ODNjMGRlZDpjc18zZDFlYzRmZDc3ZDQyZjkyOWRjZjUxMGFjMzM4Mjg3ZDdkMGMwNjZj',
//       },
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       print(data);
//       return data.map((item) => ShopesMamaModel.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load data: ${response.statusCode}');
//     }
//   }
// }
