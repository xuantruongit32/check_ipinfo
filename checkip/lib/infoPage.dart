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
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('IP: ${widget.ipinfo.ip ?? "Unknown IP"}'),
          ),
          ListTile(
            title: Text('City: ${widget.ipinfo.city ?? "Unknown City"}'),
          ),
          ListTile(
            title: Text('Region: ${widget.ipinfo.region ?? "Unknown Region"}'),
          ),
          ListTile(
            title: Text('Country: ${widget.ipinfo.country ?? "Unknown Country"}'),
          ),
          ListTile(
            title: Text('Location: ${widget.ipinfo.loc ?? "Unknown Location"}'),
          ),
          ListTile(
            title: Text('Org: ${widget.ipinfo.org ?? "Unknown Org"}'),
          ),
          ListTile(
            title: Text('Postal: ${widget.ipinfo.postal ?? "Unknown Postal"}'),
          ),
          ListTile(
            title: Text('TimeZone: ${widget.ipinfo.timezone ?? "Unknown TimeZone"}'),
          ),
        ],
      ),
    );
  }
}
