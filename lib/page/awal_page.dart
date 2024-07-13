import 'package:flutter/material.dart';
import 'package:hama_apps/config/asset_config.dart';

class AwalPage extends StatefulWidget {
  const AwalPage({super.key});

  @override
  State<AwalPage> createState() => _AwalPageState();
}

class _AwalPageState extends State<AwalPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image(
              image: const AssetImage(AssetConfig.bg),
              width: screenWidth,
              height: screenHeight,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AssetConfig.logo,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/home'),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        AssetConfig.button1,
                        width: screenHeight * 0.3,
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text(
                          "APLIKASI SISTEM \nPENGUSIR HAMA",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
