import 'package:flutter/material.dart';
import 'package:hama_apps/config/asset_config.dart';
import 'package:hama_apps/config/color_config.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Scaffold(
        body: Stack(children: [
      Center(
        child: Image(
          image: const AssetImage(AssetConfig.bg),
          width: screenWidth,
          height: screenHeight,
          fit: BoxFit.fill,
        ),
      ),
      Column(children: [
        Container(
          height: 30,
        ),
        Container(
          color: ColorConfig.blue1,
          width: screenWidth,
          height: 40,
          child: const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8),
            child: Text(
              "Anti Hama",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Stack(children: [
            Container(
              height: screenHeight * 0.5,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Lengkungan sudut
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 140.0, right: 10, left: 10),
                child: Center(
                  child: Text(
                    'Aplikasi Pest Protector adalah solusi canggih untuk monitoring dan kontrol frekuensi suara, dengan fitur manual, otomatis, serta penjadwalan fleksibel. Alat ini memancarkan frekuensi ultrasonik 20-65 kHz, cocok untuk berbagai kebutuhan. Dengan aplikasi ini, kami memberikan kemudahan dan efisiensi dalam pengelolaan frekuensi suara, memastikan segala kebutuhan Anda terpenuhi dengan aman dan tepat waktu.',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.18,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20), // Lengkungan sudut
              ),
              child: Center(
                child: Image.asset(
                  AssetConfig.logoabout,
                  width: 120,
                  height: 120,
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/home'),
            child: Image.asset(
              AssetConfig.back,
              width: 50,
              height: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Row(
            children: [
              Image.asset(
                AssetConfig.copyright,
                width: 50,
                height: 50,
              ),
              const Text("42620070 & 42620073 \nTMJ ANGKATAN 20")
            ],
          ),
        )
      ])
    ]));
  }
}
