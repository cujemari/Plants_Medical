import 'package:app_plants/presentation/views/details/distribution/detail_distribution.dart';
import 'package:app_plants/presentation/views/details/use/detail_use_for_plant.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final int plantaId;

  const ActionButtons({super.key, required this.plantaId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: _buildButton(context, 'Usos', 'assets/logos/use.png'),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildButton(
              context,
              'Distribución',
              'assets/logos/distri.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, String imagePath) {
    return ElevatedButton(
      onPressed: () {
        final route = label == "Usos"
            ? DetailUseForPlant(plantaId: plantaId)
            : DetailDistribution(plantaId: plantaId);

        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[800],
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ), // ← eliminamos horizontal fijo
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              imagePath,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgia',
            ),
          ),
        ],
      ),
    );
  }
}
