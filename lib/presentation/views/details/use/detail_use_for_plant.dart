import 'package:app_plants/data/models/disease_model.dart';
import 'package:app_plants/data/models/disease_plant_use_model.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/disease_repository_impl.dart';
import 'package:app_plants/data/repositories/plant_repository_impl.dart';
import 'package:app_plants/data/repositories/preparationuse_repository_impl.dart';
import 'package:flutter/material.dart';

class DetailUseForPlant extends StatefulWidget {
  final int plantaId;
  final int? enfermedadId;

  const DetailUseForPlant({Key? key, required this.plantaId, this.enfermedadId})
    : super(key: key);

  @override
  State<DetailUseForPlant> createState() => _DetailUsoState();
}

class _DetailUsoState extends State<DetailUseForPlant> {
  final _plantRepository = PlantRepositoryImpl();
  final _diseaseRepository = DiseaseRepositoryImpl();
  final _usesRepository = PreparationuseRepositoryImpl();

  MedicinalPlantModel? _plant;
  List<DiseasePlantUseModel> _uses = [];
  Map<int, DiseaseModel> _diseasesMap = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() => _isLoading = true);

    final plant = await _plantRepository.getPlantaById(widget.plantaId);
    final allUses = await _usesRepository.getUsesByPlantId(widget.plantaId);

    if (plant == null) {
      setState(() {
        _plant = null;
        _uses = [];
        _isLoading = false;
      });
      return;
    }

    final filteredUses = widget.enfermedadId != null
        ? allUses.where((u) => u.diseplantId == widget.enfermedadId).toList()
        : allUses.toList();
    filteredUses.sort((a, b) => a.diseplantId.compareTo(b.diseplantId));

    final diseasesMap = <int, DiseaseModel>{};
    for (var use in filteredUses) {
      if (!diseasesMap.containsKey(use.diseaseId)) {
        final disease = await _diseaseRepository.getDiseaseById(use.diseaseId);
        if (disease != null) {
          diseasesMap[use.diseaseId] = disease;
        }
      }
    }

    setState(() {
      _plant = plant;
      _uses = filteredUses;
      _diseasesMap = diseasesMap;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0A2D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2D1A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (_plant != null) ...[
              Center(
                child: Text(
                  _plant!.nameplant,
                  style: const TextStyle(
                    color: Color(0xFFF5EF49),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_plant!.imageplant.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    _plant!.imageplant,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 30),
            ],

            ..._uses.map((use) {
              final diseaseName =
                  _diseasesMap[use.diseaseId]?.namedisease ?? 'Desconocida';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Tratamiento para: ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue, // Color para el texto fijo
                          ),
                        ),
                        TextSpan(
                          text: diseaseName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildUsoField('Uso:', use.use),
                  _buildUsoField('Preparación:', use.preparation),
                  _buildUsoField('Indicación:', use.indication),
                  const Divider(color: Colors.white70, height: 40),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUsoField(String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          content.isNotEmpty ? content : 'No especificado.',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: "Arial",
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
