import 'package:app_plants/data/datasources/local/tables/plant_table.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:flutter/material.dart';
import 'package:app_plants/data/datasources/local/local_database.dart';

class PlantsForDiseaseScreen extends StatefulWidget {
  final int diseaseId;

  const PlantsForDiseaseScreen({Key? key, required this.diseaseId})
    : super(key: key);

  @override
  State<PlantsForDiseaseScreen> createState() =>
      _PlantasPorEnfermedadPageState();
}

class _PlantasPorEnfermedadPageState extends State<PlantsForDiseaseScreen> {
  List<MedicinalPlantModel> _plantas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPlantas(widget.diseaseId);
  }

  Future<void> _loadPlantas(int diseaseId) async {
    final db = await LocalDatabase().database;
    final result = await db.rawQuery(
      '''
      SELECT p.* FROM ${PlantTable.tableName} p
      INNER JOIN disease_plant pd ON plant_id = pd.plant_id
      WHERE pd.disease_id = ?
    ''',
      [diseaseId],
    );

    setState(() {
      _plantas = result.map((e) => MedicinalPlantModel.fromMap(e)).toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plantas medicinales')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _plantas.length,
              itemBuilder: (context, index) {
                final planta = _plantas[index];
                return ListTile(
                  leading: Image.asset(
                    planta.imageplant,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(planta.nameplant),
                );
              },
            ),
    );
  }
}
