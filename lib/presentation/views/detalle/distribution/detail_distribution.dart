import 'package:app_plants/data/models/Geographic_distribution_model.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/geographicdistribution_repository_impl.dart';
import 'package:app_plants/data/repositories/plant_repository_impl.dart';
import 'package:flutter/material.dart';

class DetailDistribution extends StatefulWidget {
  final int plantaId;

  const DetailDistribution({Key? key, required this.plantaId})
    : super(key: key);

  @override
  State<DetailDistribution> createState() => _DetailDistributionState();
}

class _DetailDistributionState extends State<DetailDistribution> {
  final _plantRepository = PlantRepositoryImpl();
  final _distributionRepository = GeographicDistributionRepositoryImpl();

  MedicinalPlantModel? _plant;
  DistributionModel? _distribution;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final plant = await _plantRepository.getPlantaById(widget.plantaId);
    final distribution = await _distributionRepository.getDistribucionById(
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
      backgroundColor: Color(0XFF0A2D14),
      appBar: AppBar(
        backgroundColor: Color(0XFF0A2D14),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(23.0),
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
                margin: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 20,
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
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Distribución:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                _distribution?.descriptiondistribution ?? 'No disponible',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: "Arial",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
