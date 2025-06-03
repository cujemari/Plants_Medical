import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/plant_table.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:sqflite/sqflite.dart';

class PlantRepositoryImpl {
  // Método para insertar planta
  Future<void> insertarPlanta(MedicinalPlantModel planta) async {
    final db = await LocalDatabase().database;
    try {
      await db.insert(
        PlantTable.tableName,
        planta.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Error al insertar planta: $e");
    }
  }

  // Método para obtener planta por ID
  Future<MedicinalPlantModel?> getPlantaById(int id) async {
    final db = await LocalDatabase().database;

    final result = await db.query(
      PlantTable.tableName,
      where: 'plant_id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return MedicinalPlantModel.fromMap(result.first);
    } else {
      return null;
    }
  }

  // Método para obtener todas las plantas
  Future<List<MedicinalPlantModel>> getPlantas() async {
    final db = await LocalDatabase().database;
    final data = await db.query(PlantTable.tableName);
    return data.map((e) => MedicinalPlantModel.fromMap(e)).toList();
  }

  // Método para actualizar planta
  Future<int> updatePlant(MedicinalPlantModel planta) async {
    final db = await LocalDatabase().database;
    return await db.update(
      PlantTable.tableName,
      planta.toMap(),
      where: 'plant_id = ?',
      whereArgs: [planta.plantId],
    );
  }

  // Método para eliminar planta
  Future<int> deletePlant(int id) async {
    final db = await LocalDatabase().database;
    return await db.delete(
      PlantTable.tableName,
      where: 'plant_id = ?',
      whereArgs: [id],
    );
  }
}
