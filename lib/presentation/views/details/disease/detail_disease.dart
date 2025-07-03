import 'package:flutter/material.dart';
import 'package:app_plants/data/models/disease_model.dart';
import 'package:app_plants/data/repositories/disease_repository_impl.dart';
import 'package:app_plants/presentation/views/details/plant/plants_for_disease_screen.dart';

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

  @override
  void initState() {
    super.initState();
    _fetchDisease();
  }

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
      backgroundColor: const Color(0xFF0A2D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2D1A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Center(
              child: Text(
                _disease!.namedisease,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Imagen
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                _disease!.imagedisease,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 22),

            // Descripción
            _buildSectionTitle('Descripción:'),
            _buildSectionContent(_disease!.descriptiondisease),

            // Síntomas
            _buildSectionTitle('Síntomas:'),
            _buildSectionContent(_disease!.symptoms),

            const SizedBox(height: 24),

            // Botón ver plantas
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
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
                      builder: (_) => PlantsForDiseaseScreen(
                        diseaseId: _disease!.diseaseId,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.local_florist, color: Colors.blueAccent),
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

  Widget _buildSectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 8, top: 22),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
        fontFamily: 'Times New Roman',
      ),
    ),
  );

  Widget _buildSectionContent(String text) => Center(
    child: Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontFamily: 'Arial',
      ),
    ),
  );
}
