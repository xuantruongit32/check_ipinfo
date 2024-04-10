import 'package:checkip/model/ip.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.ipinfo});
  final IP ipinfo;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('City: ${widget.ipinfo.city ?? "Unknown City"}'),
        Text('Region: ${widget.ipinfo.region ?? "Unknown Region"}'),
        Text('Location: ${widget.ipinfo.loc ?? "Unknown Location"}'),
      ],
    );
  }
}
