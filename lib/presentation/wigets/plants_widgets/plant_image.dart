import 'package:flutter/material.dart';

class PlantImage extends StatelessWidget {
  final String imagePath;

  const PlantImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(imagePath, width: 370, fit: BoxFit.cover),
    );
  }
}
