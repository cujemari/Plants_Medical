import 'package:app_plants/data/models/preparation_use_model.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/plant_repository_impl.dart';
import 'package:app_plants/data/repositories/preparationuse_repository_impl.dart';
import 'package:flutter/material.dart';

class DetailUso extends StatefulWidget {
  final int plantaId;

  const DetailUso({Key? key, required this.plantaId}) : super(key: key);

  @override
  State<DetailUso> createState() => _DetailUsoState();
}

class _DetailUsoState extends State<DetailUso> {
  final _plantRepository = PlantRepositoryImpl();
  final _UsesRepository = PreparationuseRepositoryImpl();

  MedicinalPlantModel? _plant;
  PreparationUseModel? _preparationUse;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final plant = await _plantRepository.getPlantaById(widget.plantaId);
    final use = await _UsesRepository.getPreparationUseById(widget.plantaId);
    setState(() {
      _plant = plant;
      _preparationUse = use;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Color(0xFF0A2D1A),

      appBar: AppBar(
        backgroundColor: Color(0xFF0A2D1A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                _plant?.nameplant ?? '',
                style: const TextStyle(
                  color: Color(0xFFF5EF49),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (_plant != null) ...[
              Text(
                _plant!.nameplant,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              if (_plant!.imageplant.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    _plant!.imageplant,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
            const SizedBox(height: 20),
            const Text(
              'Uso:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              _preparationUse?.use ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Arial",
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Preparación:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              _preparationUse?.preparation ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Arial",
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              'Indicación:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            Text(
              _preparationUse?.indication ?? 'No encontrada',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Arial",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
