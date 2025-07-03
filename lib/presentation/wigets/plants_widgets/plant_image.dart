import 'package:flutter/material.dart';

class PlantImage extends StatelessWidget {
  final String imagePath;

  const PlantImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        width: 370,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, color: Colors.white54, size: 100),
      ),
    );
  }
}
