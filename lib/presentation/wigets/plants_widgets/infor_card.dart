import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final bool isItalic;
  final bool isJustified;

  const InfoCard({
    super.key,
    required this.title,
    required this.content,
    this.isItalic = false,
    this.isJustified = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color(0xB30A2D14),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontStyle: isItalic ? FontStyle.italic : null,
              ),
              textAlign: isJustified ? TextAlign.justify : null,
            ),
          ],
        ),
      ),
    );
  }
}
