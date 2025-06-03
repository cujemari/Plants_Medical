import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/distribution_table.dart';
import 'package:app_plants/data/models/Geographic_distribution_model.dart';
import 'package:sqflite/sqflite.dart';

class GeographicDistributionRepositoryImpl {
  // Insertar distribución geográfica
  Future<void> insertarDistribucion(DistributionModel distribucion) async {
    final db = await LocalDatabase().database;
    try {
      await db.insert(
        DistributionTable.tablename,
        distribucion.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Error al insertar distribución geográfica: $e");
    }
  }

  // Obtener distribución por ID
  Future<DistributionModel?> getDistribucionById(int id) async {
    final db = await LocalDatabase().database;
    final result = await db.query(
      DistributionTable.tablename,
      where: 'distribution_id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return DistributionModel.fromJson(result.first);
    }
    return null;
  }

  // Obtener todas las distribuciones
  Future<List<DistributionModel>> getAllDistribuciones() async {
    final db = await LocalDatabase().database;
    final result = await db.query(DistributionTable.tablename);
    return result.map((json) => DistributionModel.fromJson(json)).toList();
  }
}
