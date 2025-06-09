import 'package:sqflite/sqflite.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';

class PlantDiseaseRepository {
  final Database db;

  PlantDiseaseRepository(this.db);

  // Obtener todas las plantas asociadas a una enfermedad
  Future<List<MedicinalPlantModel>> getPlantsByDiseaseId(int diseaseId) async {
    final result = await db.rawQuery(
      '''
      SELECT p.* FROM plant p
      INNER JOIN disease_plant_use pd ON p.plant_id = pd.plant_id
      WHERE pd.disease_id = ?
    ''',
      [diseaseId],
    );

    return result.map((e) => MedicinalPlantModel.fromMap(e)).toList();
  }
}
