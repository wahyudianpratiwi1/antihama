import 'package:flutter/material.dart';

class ContainerSensor extends StatelessWidget {
  final String label;
  final List<Color> colors;
  const ContainerSensor({super.key, required this.label, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 90,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Widget _buildSensorContainer(String label, List<Color> colors) {
//   print('Building container with colors: $colors');

//   return Container(
//     width: 50,
//     height: 50,
//     margin: const EdgeInsets.all(8.0),
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         colors: colors,
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ),
//     ),
//     child: Center(
//       child: Text(
//         label,
//         style: const TextStyle(color: Colors.white, fontSize: 16),
//       ),
//     ),
//   );
// }
