import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:flutter/material.dart';

class PlantGridItem extends StatelessWidget {
  final MedicinalPlantModel planta;
  final VoidCallback onTap;

  const PlantGridItem({required this.planta, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 140,
              width: double.infinity,
              child: Image.asset(planta.imageplant, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 9),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 3, 50, 27),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                planta.nameplant,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
