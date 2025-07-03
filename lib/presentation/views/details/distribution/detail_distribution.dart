import 'package:flutter/material.dart';
import 'package:app_plants/data/models/distribution_model.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/distribution_repository_impl.dart';
import 'package:app_plants/data/repositories/plant_repository_impl.dart';

class DetailDistribution extends StatefulWidget {
  final int plantaId;

  const DetailDistribution({super.key, required this.plantaId});

  @override
  State<DetailDistribution> createState() => _DetailDistributionState();
}

class _DetailDistributionState extends State<DetailDistribution> {
  final _plantRepo = PlantRepositoryImpl();
  final _distributionRepo = DistributionRepositoryImpl();

  MedicinalPlantModel? _plant;
  DistributionModel? _distribution;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final plant = await _plantRepo.getPlantaById(widget.plantaId);
    final distribution = await _distributionRepo.getDistribucionById(
      widget.plantaId,
    );

    setState(() {
      _plant = plant;
      _distribution = distribution;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0A2D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2D14),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23),
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

            if (_distribution?.imagenmap != null)
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    _distribution!.imagenmap,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.broken_image,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Distribución:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _distribution?.descriptiondistribution ?? 'No disponible',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: 'Arial',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
