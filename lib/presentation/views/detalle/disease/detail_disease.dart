import 'package:app_plants/presentation/views/detalle/plant/plants_for_disease_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_plants/data/models/disease_model.dart';
import 'package:app_plants/data/repositories/disease_repository_impl.dart';

class DetailDisease extends StatefulWidget {
  final int diseaseId;

  const DetailDisease({Key? key, required this.diseaseId}) : super(key: key);

  @override
  State<DetailDisease> createState() => _DetailDiseaseState();
}

class _DetailDiseaseState extends State<DetailDisease> {
  DiseaseModel? _disease;
  bool _isLoading = true;

  final DiseaseRepositoryImpl _diseaseRepository = DiseaseRepositoryImpl();

  Future<void> _fetchDisease() async {
    try {
      final disease = await _diseaseRepository.getDiseaseById(widget.diseaseId);
      setState(() {
        _disease = disease;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error al cargar la enfermedad: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDisease();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_disease == null) {
      return const Scaffold(
        body: Center(child: Text('Enfermedad no encontrada')),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFF0A2D1A),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A2D1A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                _disease!.namedisease,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Image.asset(
              _disease!.imagedisease,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 200),
            ),
            const SizedBox(height: 22),
            const Text(
              'Descripción:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                _disease!.descriptiondisease,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: "Arial",
                ),
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Sintomas:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                _disease!.symptoms,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: "Arial",
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,

                  elevation: 4,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlantsForDiseaseScreen(
                        diseaseId: _disease!.diseaseId,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.local_florist, color: Colors.green),
                label: const Text(
                  'Ver plantas medicinales',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
