import 'package:app_plants/presentation/views/details/use/detail_use_for_disease.dart';
import 'package:flutter/material.dart';
import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/plantdisease_repository_impl.dart';

class PlantsForDiseaseScreen extends StatefulWidget {
  final int diseaseId;

  const PlantsForDiseaseScreen({Key? key, required this.diseaseId})
    : super(key: key);

  @override
  State<PlantsForDiseaseScreen> createState() => _PlantsForDiseaseScreenState();
}

class _PlantsForDiseaseScreenState extends State<PlantsForDiseaseScreen> {
  List<MedicinalPlantModel> _plantas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPlantas();
  }

  Future<void> _loadPlantas() async {
    final db = await LocalDatabase().database;
    final repo = PlantDiseaseRepository(db);
    final plantas = await repo.getPlantsByDiseaseId(widget.diseaseId);

    setState(() {
      _plantas = plantas;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Plantas Recomendadas',
          style: TextStyle(
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),

      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _plantas.isEmpty
          ? const Center(child: Text('No se encontraron plantas.'))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: _plantas.length,
                itemBuilder: (context, index) {
                  final planta = _plantas[index];
                  return Card(
                    color: const Color.fromARGB(255, 3, 50, 27),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          planta.imageplant,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        planta.nameplant,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        planta.cientificname,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailUseForDisease(
                              enfermedadId: widget.diseaseId,
                              plantaId: planta.plantId,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}
