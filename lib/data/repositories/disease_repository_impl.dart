import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/disease_table.dart';
import 'package:app_plants/data/models/disease_model.dart';
import 'package:sqflite/sqflite.dart';

class DiseaseRepositoryImpl {
  // Insertar una enfermedad
  Future<void> insertarEnfermedad(DiseaseModel disease) async {
    final db = await LocalDatabase().database;
    try {
      await db.insert(
        DiseaseTable.tablename,
        disease.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Error al insertar enfermedad: $e");
    }
  }

  // Obtener enfermedad por ID
  Future<DiseaseModel?> getDiseaseById(int id) async {
    final db = await LocalDatabase().database;
    final result = await db.query(
      DiseaseTable.tablename,
      where: 'disease_id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return DiseaseModel.fromMap(result.first);
    } else {
      return null;
    }
  }

  // Obtener todas las enfermedades
  Future<List<DiseaseModel>> getAllDiseases() async {
    final db = await LocalDatabase().database;
    final result = await db.query(DiseaseTable.tablename);
    return result.map((json) => DiseaseModel.fromJson(json)).toList();
  }

  // Actualizar enfermedad
  Future<int> updateDisease(DiseaseModel disease) async {
    final db = await LocalDatabase().database;
    return await db.update(
      DiseaseTable.tablename,
      disease.toMap(),
      where: 'disease_id = ?',
      whereArgs: [disease.diseaseId],
    );
  }

  // Eliminar enfermedad
  Future<int> deleteDisease(int id) async {
    final db = await LocalDatabase().database;
    return await db.delete(
      DiseaseTable.tablename,
      where: 'disease_id = ?',
      whereArgs: [id],
    );
  }
}
