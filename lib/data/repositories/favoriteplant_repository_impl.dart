import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/favorite_plant_table.dart';
import 'package:app_plants/data/datasources/local/tables/plant_table.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteplantRepositoryImpl {
  Future<void> addFavorite(int plantId) async {
    final db = await LocalDatabase().database;
    await db.insert(FavoritePlantTable.tablename, {
      'plant_id': plantId,
    }, conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<void> removeFavorite(int plantId) async {
    final db = await LocalDatabase().database;
    await db.delete(
      FavoritePlantTable.tablename,
      where: 'plant_id = ?',
      whereArgs: [plantId],
    );
  }

  Future<bool> isFavorite(int plantId) async {
    final db = await LocalDatabase().database;
    final maps = await db.query(
      FavoritePlantTable.tablename,
      where: 'plant_id = ?',
      whereArgs: [plantId],
    );
    return maps.isNotEmpty;
  }

  Future<MedicinalPlantModel?> getPlantById(int id) async {
    final db = await LocalDatabase().database;
    final result = await db.query(
      PlantTable.tableName, // ✅ tabla correcta
      where: 'plant_id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return MedicinalPlantModel.fromMap(result.first);
    }
    return null;
  }

  Future<List<int>> getFavorites() async {
    final db = await LocalDatabase().database;
    final result = await db.query(
      FavoritePlantTable.tablename,
    ); // "favorite_plant"

    final favoriteIds = result
        .map((row) {
          final idValue = row['plant_id'];
          if (idValue == null) return null;
          return int.tryParse(idValue.toString());
        })
        .where((id) => id != null)
        .cast<int>()
        .toList();

    return favoriteIds;
  }
}
