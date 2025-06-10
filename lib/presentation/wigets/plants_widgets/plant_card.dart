import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  final MedicinalPlantModel plant;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const PlantCard({
    super.key,
    required this.plant,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: width * 0.30,
                right: 16,
                top: 25,
                bottom: 5,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 50, 27),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plant.nameplant,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          plant.cientificname,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          plant.family,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.green),
                    onPressed: onRemove,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -10,
              left: -10,
              child: Container(
                width: width * 0.28,
                height: width * 0.28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(3, 5),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(plant.imageplant),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
