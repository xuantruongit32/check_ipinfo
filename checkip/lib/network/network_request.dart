import 'dart:convert';

import 'package:checkip/model/ip.dart';
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

  Future<IP> fetchIPinfo(String ip) async {
    String url2 = 'https://ipinfo.io/$ip/geo';

    final response = await http.get(Uri.parse(url2));

    if (response.statusCode == 200) {
      return IP.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
