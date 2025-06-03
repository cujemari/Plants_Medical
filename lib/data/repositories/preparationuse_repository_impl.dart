import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/preparation_use_table.dart';
import 'package:app_plants/data/models/preparation_use_model.dart';
import 'package:sqflite/sqflite.dart';

class PreparationuseRepositoryImpl {
  // Insertar un registro de uso y preparación
  Future<void> insertarPreparationUse(PreparationUseModel preparation) async {
    final db = await LocalDatabase().database;
    try {
      await db.insert(
        UseTable.tableName,
        preparation.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Error al insertar preparation_use: $e");
    }
  }

  // Obtener un registro por ID
  Future<PreparationUseModel?> getPreparationUseById(int id) async {
    final db = await LocalDatabase().database;
    final result = await db.query(
      UseTable.tableName,
      where: 'preparationuse_id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return PreparationUseModel.fromJson(result.first);
    }
    return null;
  }

  // Obtener todos los registros
  Future<List<PreparationUseModel>> getAllPreparationUses() async {
    final db = await LocalDatabase().database;
    final result = await db.query(UseTable.tableName);
    return result.map((json) => PreparationUseModel.fromJson(json)).toList();
  }

  // Actualizar un registro
  Future<int> updatePreparationUse(PreparationUseModel preparationUse) async {
    final db = await LocalDatabase().database;
    return await db.update(
      UseTable.tableName,
      preparationUse.toMap(),
      where: 'preparationuses_id = ?',
      whereArgs: [preparationUse.preparationuseId],
    );
  }
}
