import 'package:checkip/infoPage.dart';
import 'package:checkip/model/ip.dart';
import 'package:checkip/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.ip});
  final String ip;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IP ipinfo = IP();

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    void copyTextToClipBoard(String text, BuildContext context) {
      Clipboard.setData(
        ClipboardData(
          text: text,
        ),
      );
    }

    Future<void> fetchIpInfo() async {
      IP fetchedIpInfo = await NetworkResquest().fetchIPinfo(widget.ip);
      setState(() {
        ipinfo = fetchedIpInfo;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Gap(40),
            const Center(
              child: Text(
                'Your IP Address:',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.ip,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(10),
                GestureDetector(
                  onTap: () {
                    copyTextToClipBoard(widget.ip, context);
                  },
                  child: const Icon(Icons.copy),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'SEARCH IP INFO',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                fetchIpInfo();
              },
              child: const Text('Search'),
            ),
            InfoPage(
              ipinfo: ipinfo,
            ),
          ],
        ),
      ),
    );
  }
}
