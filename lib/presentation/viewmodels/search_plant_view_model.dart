import 'package:flutter/material.dart';
import '../../data/models/medicinal_plant_model.dart';
import '../../data/datasources/local/local_database.dart';
import '../../data/datasources/local/tables/plant_table.dart';

class SearchPlantViewModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  List<MedicinalPlantModel> _plantas = [];
  List<MedicinalPlantModel> plantasFiltradas = [];
  bool isLoading = true;

  Future<void> loadPlantas() async {
    final db = await LocalDatabase().database;
    final data = await db.query(PlantTable.tableName);
    _plantas = data.map((e) => MedicinalPlantModel.fromMap(e)).toList();
    plantasFiltradas = _plantas;
    isLoading = false;
    notifyListeners();
  }

  void filtrarPlantas(String query) {
    final q = query.toLowerCase();
    plantasFiltradas = _plantas.where((planta) {
      return planta.nameplant.toLowerCase().contains(q) ||
          planta.vulgarsynomaly.toLowerCase().contains(q) ||
          planta.family.toLowerCase().contains(q) ||
          planta.botanicaldescription.toLowerCase().contains(q) ||
          planta.habitat.toLowerCase().contains(q) ||
          planta.chemicalcomposition.toLowerCase().contains(q);
    }).toList();
    notifyListeners();
  }
}
