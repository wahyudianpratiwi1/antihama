import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hama_apps/config/asset_config.dart';
import 'package:hama_apps/config/color_config.dart';
import 'package:hama_apps/controller/sensor_controller.dart';
import 'package:hama_apps/widget/sensor_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    // final SensorController sensorController = Get.put(SensorController());
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Anti Hama",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: ColorConfig.blue1,
            toolbarHeight: 40,
            automaticallyImplyLeading: false),
        body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Stack(children: [
                    Center(
                      child: Image(
                        image: const AssetImage(AssetConfig.bg),
                        width: screenWidth,
                        height: 950,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Column(
                      children: [Widget1(), Widget2()],
                    )
                  ])));
        })));
  }
}

class Widget1 extends StatefulWidget {
  const Widget1({super.key});

  @override
  State<Widget1> createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    final SensorController sensorController = Get.put(SensorController());
    return Column(
      children: [
        Container(
          height: 30,
        ),
        // Container(
        //   color: ColorConfig.blue1,
        //   width: screenWidth,
        //   height: 40,
        //   child: const Padding(
        //     padding: EdgeInsets.only(top: 8.0, left: 8),
        //     child: Text(
        //       "Anti Hama",
        //       style: TextStyle(
        //           fontSize: 16,
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 40),
          child: Row(
            children: [
              Container(
                height: 30,
                width: screenWidth * 0.9,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/info'),
                child: Image.asset(
                  AssetConfig.info,
                  width: 30,
                  height: 30,
                ),
              )
            ],
          ),
        ),
        Container(
          height: screenHeight * 0.3,
          width: screenWidth * 0.8,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConfig.blue3, // Warna atas
                ColorConfig.blue2, // Warna bawah
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 3), // Posisi bayangan
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                color: ColorConfig.blue1,
                width: screenWidth,
                height: 40,
                child: const Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 8),
                  child: Center(
                    child: Text(
                      "Metode Pengguna",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ColorConfig.gray, // Warna atas
                        ColorConfig.blue4, // Warna bawah
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AssetConfig.iconmesin,
                        width: 40,
                        height: 40,
                      ),
                      Obx((() {
                        return Transform.scale(
                            scale: 1.5,
                            child: SwitchListTile(
                              value:
                                  sensorController.sensorData.value.manual == 1,
                              onChanged: (bool value) {
                                int manualValue = value ? 1 : 0;
                                sensorController.updateManual(manualValue);
                              },
                              activeColor: Colors.white,
                              inactiveThumbColor: Colors.transparent,
                              inactiveTrackColor: ColorConfig.blue4,
                            ));
                      })),
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          "Kontrol \nManual/Auto",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Widget2 extends StatefulWidget {
  const Widget2({super.key});

  @override
  State<Widget2> createState() => _Widget2State();
}

class _Widget2State extends State<Widget2> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    final SensorController sensorController = Get.put(SensorController());
    return Column(
      children: [
        Container(
          height: 30,
        ),
        Container(
            height: screenHeight * 0.3,
            width: screenWidth * 0.8,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConfig.blue3, // Warna atas
                  ColorConfig.blue2, // Warna bawah
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // Posisi bayangan
                ),
              ],
            ),
            child: Column(children: [
              Container(
                color: ColorConfig.blue1,
                width: screenWidth,
                height: 40,
                child: const Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 8),
                  child: Center(
                    child: Text(
                      "Jadwal Penggunaan",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerSensor(
                      label: "Pagi :\n08:00 AM -11:00 AM",
                      colors: sensorController.sensorData.value.pagi == 1
                          ? [ColorConfig.gray, Colors.green]
                          : [ColorConfig.gray, ColorConfig.blue3],
                    ),
                    ContainerSensor(
                      label: "Siang :\n13:00 PM -16:00 PM ",
                      colors: sensorController.sensorData.value.siang == 1
                          ? [ColorConfig.gray, Colors.green]
                          : [ColorConfig.gray, ColorConfig.blue3],
                    )
                  ],
                );
              }),
              Obx(() {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerSensor(
                        label: "Malam :\n20:00 PM -23:00 PM",
                        colors: sensorController.sensorData.value.malam == 1
                            ? [ColorConfig.gray, Colors.green]
                            : [ColorConfig.gray, ColorConfig.blue3],
                      ),
                    ]);
              }),
            ])),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            color: ColorConfig.blue1,
            width: screenWidth * 0.8,
            height: 40,
            child: const Padding(
              padding: EdgeInsets.only(top: 5.0, left: 8),
              child: Center(
                child: Text(
                  "Frekuensi Yang Terpakai",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: screenHeight * 0.15,
          width: screenWidth * 0.8,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConfig.blue3, // Warna atas
                Color.fromARGB(255, 78, 149, 194), // Warna bawah
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 3), // Posisi bayangan
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                      "${sensorController.sensorData.value.frekuensi} kHz",
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold)),
                );
              }),
              Text(
                "──────────────────────── kHz",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
