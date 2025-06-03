import 'package:app_plants/presentation/views/detalle/distribution/detail_distribution.dart';
import 'package:app_plants/presentation/views/detalle/use/detail_uso.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton(context, 'Usos', 'assets/logos/use.png'),
          _buildButton(context, 'Distribución', 'assets/logos/distri.png'),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green[800],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (label == "Usos") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailUso(plantaId: 1)),
            );
          }
          if (label == "Distribución") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailDistribution(plantaId: 1),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
