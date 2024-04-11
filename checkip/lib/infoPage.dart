import 'package:checkip/model/ip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          _buildListTile(
            'IP: ${widget.ipinfo.ip ?? "Unknown IP"}',
          ),
          _buildListTile(
            'City: ${widget.ipinfo.city ?? "Unknown City"}',
          ),
          _buildListTile(
            'Region: ${widget.ipinfo.region ?? "Unknown Region"}',
          ),
          _buildListTile(
            'Country: ${widget.ipinfo.country ?? "Unknown Country"}',
          ),
          _buildListTile(
            'Location: ${widget.ipinfo.loc ?? "Unknown Location"}',
          ),
          _buildListTile(
            'Org: ${widget.ipinfo.org ?? "Unknown Org"}',
          ),
          _buildListTile(
            'Postal: ${widget.ipinfo.postal ?? "Unknown Postal"}',
          ),
          _buildListTile(
            'TimeZone: ${widget.ipinfo.timezone ?? "Unknown TimeZone"}',
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile(String title) {
    final splitTitle = title.split(':');
    final copiedContent = splitTitle.length > 1 ? splitTitle[1].trim() : '';
    return ListTile(
      title: Text(title),
      trailing: IconButton(
        icon: const Icon(
          Icons.content_copy,
        ),
        onPressed: () {
          Clipboard.setData(
            ClipboardData(text: copiedContent),
          );
        },
      ),
    );
  }
}
