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
            child: Image.asset(
              planta.imageplant,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 9),
            decoration: BoxDecoration(
              color: const Color(0xFF185A1A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              planta.nameplant,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
