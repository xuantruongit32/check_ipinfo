import 'package:checkip/network/network_request.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.ip});
  final String ip;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late var ipinfo;
  @override
  void initState() async {
    ipinfo = await NetworkResquest().fetchIPinfo(widget.ip);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(ipinfo.city!),
        Text(ipinfo.region!),
        Text(ipinfo.country!),
      ],
    );
  }
}
