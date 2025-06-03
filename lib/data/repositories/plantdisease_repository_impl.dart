import 'package:sqflite/sqflite.dart';

class PlantdiseaseRepositoryImpl {
  final Database db;

  PlantdiseaseRepositoryImpl(this.db);

  // Insertar relación planta-enfermedad
  Future<int> insertPlantDisease({
    required int plantId,
    required int diseaseId,
    String syncStatus = 'pending',
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    return await db.insert(
      'plant_disease',
      {
        'plant_id': plantId,
        'disease_id': diseaseId,
        'sync_status': syncStatus,
        'last_updated': now,
      },
      conflictAlgorithm:
          ConflictAlgorithm.ignore, // Evita duplicados si quieres
    );
  }

  // Eliminar relación por plantdisease_id
  Future<int> deletePlantDiseaseById(int plantDiseaseId) async {
    return await db.delete(
      'plant_disease',
      where: 'plantdisease_id = ?',
      whereArgs: [plantDiseaseId],
    );
  }

  // Eliminar relación por plant_id y disease_id
  Future<int> deletePlantDisease({
    required int plantId,
    required int diseaseId,
  }) async {
    return await db.delete(
      'plant_disease',
      where: 'plant_id = ? AND disease_id = ?',
      whereArgs: [plantId, diseaseId],
    );
  }

  // Obtener todas las enfermedades asociadas a una planta (lista de mapas)
  Future<List<Map<String, dynamic>>> getDiseasesByPlantId(int plantId) async {
    return await db.query(
      'plant_disease',
      where: 'plant_id = ?',
      whereArgs: [plantId],
    );
  }
}
