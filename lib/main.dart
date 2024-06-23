import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_white_watch_face_cwf001/infoPage/info-page.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url =
    Uri.parse('https://play.google.com/store/apps/dev?id=5602369099352638268');

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/page1.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ModernButton(
                  onPressed: _launchUrl,
                  text: 'Go to Calkanos\' Portfolio',
                  imageAsset: 'assets/images/playstoreicon.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ModernButton(
                  onPressed: () {
                    _goInfoPage(context);
                  },
                  text: 'Go Info Page',
                  imageAsset: 'assets/images/infoIcon.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ModernButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String imageAsset;

  const ModernButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 66, 66, 66),
              Color.fromARGB(255, 41, 41, 41)
            ],
            begin: Alignment.topRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 8.0,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              scale: 4,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

Future<void> _goInfoPage(BuildContext context) async {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const InfoPage()),
  );
}
