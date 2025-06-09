import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/disease_plant_use_table.dart';
import 'package:app_plants/data/models/disease_plant_use_model.dart';
import 'package:sqflite/sqflite.dart';

class PreparationuseRepositoryImpl {
  // Insertar un registro de uso y preparación
  Future<void> insertarPreparationUse(DiseasePlantUseModel preparation) async {
    final db = await LocalDatabase().database;
    try {
      await db.insert(
        DiseasePlantUseTable.tableName,
        preparation.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Error al insertar preparation_use: $e");
    }
  }

  // Obtener todos los usos por planta (ajustar el nombre de columna según tabla)
  Future<List<DiseasePlantUseModel>> getUsesByPlantId(int plantId) async {
    final db = await LocalDatabase().database;
    final List<Map<String, dynamic>> results = await db.query(
      DiseasePlantUseTable.tableName,
      where: 'plant_id = ?',
      whereArgs: [plantId],
    );

    return results.map((json) => DiseasePlantUseModel.fromMap(json)).toList();
  }

  // Obtener todos los registros
  Future<List<DiseasePlantUseModel>> getAllPreparationUses() async {
    final db = await LocalDatabase().database;
    final result = await db.query(DiseasePlantUseTable.tableName);
    return result.map((json) => DiseasePlantUseModel.fromMap(json)).toList();
  }

  // Actualizar un registro
  Future<int> updatePreparationUse(DiseasePlantUseModel preparationUse) async {
    final db = await LocalDatabase().database;
    return await db.update(
      DiseasePlantUseTable.tableName,
      preparationUse.toMap(),
      where:
          'diseplantId = ?', // <-- Ajustar a 'diseplantId' si así está en la tabla
      whereArgs: [preparationUse.diseplantId],
    );
  }
}
