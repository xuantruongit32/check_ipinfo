import 'package:checkip/network/network_request.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.ip});
  final String? ip;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late var ipinfo;
  void fetchIpInfo() async {
    ipinfo = await NetworkResquest().fetchIPinfo(widget.ip!);
    setState(() {});
  }

  @override
  void initState() {
    if (widget.ip != '') {
      fetchIpInfo();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.ip == ''
        ? Container()
        : Column(
            children: [
              Text(ipinfo.city!),
              Text(ipinfo.region!),
              Text(ipinfo.country!),
            ],
          );
  }
}
