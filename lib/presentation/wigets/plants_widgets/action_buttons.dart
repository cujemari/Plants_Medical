import 'package:app_plants/presentation/views/detalle/distribution/detail_distribution.dart';
import 'package:app_plants/presentation/views/detalle/use/detail_use_for_plant.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final int plantaId;

  const ActionButtons({super.key, required this.plantaId});

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
        borderRadius: BorderRadius.circular(15),
        color: Colors.green[800],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (label == "Usos") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailUseForPlant(plantaId: plantaId),
              ),
            );
          } else if (label == "Distribución") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailDistribution(plantaId: plantaId),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                imagePath,
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
