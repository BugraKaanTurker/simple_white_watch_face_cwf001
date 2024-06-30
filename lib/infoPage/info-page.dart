import 'package:flutter/material.dart';
import 'package:simple_white_watch_face_cwf001/main.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final List<String> imagePaths = [
    'assets/images/page2.png',
    'assets/images/page3.png',
    'assets/images/page4.png',
    'assets/images/page5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        title: const Text('Info Page'),
      ),
      body: PageView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
