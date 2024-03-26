import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.ip});
  final String ip;

  @override
  Widget build(BuildContext context) {
    void _copyTextToClipBoard(String text, BuildContext context) {
      Clipboard.setData(
        ClipboardData(
          text: text,
        ),
      );
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
                ip,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              GestureDetector(
                  onTap: () {
                    _copyTextToClipBoard(ip, context);
                  },
                  child: const Icon(Icons.copy)),
            ],
          ),
        ],
      ),
    ));
  }
}
