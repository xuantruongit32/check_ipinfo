import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkResquest {
  final String url1 = 'https://api.ipify.org/?format=json';

  Future<String> fetchYourIP() async {
    String ip;
    final response = await http.get(Uri.parse(url1));
    final Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      ip = data['ip'];
      return ip;
    } else {
      throw Exception('Failed');
    }
  }
}
