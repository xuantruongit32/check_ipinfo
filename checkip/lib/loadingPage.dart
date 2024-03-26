import 'package:checkip/homePage.dart';
import 'package:checkip/network/network_request.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({super.key});
  late String ip;

  Future<bool> fetchData() async {
    try {
      ip = await NetworkResquest().fetchYourIP();
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return HomePage(ip: ip);
              }
            }));
  }
}
