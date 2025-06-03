import 'package:sqflite/sqflite.dart';

class PlantTable {
  static const String tableName = 'plant';

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        plant_id INTEGER PRIMARY KEY,
        name_plant TEXT,
        image_plant TEXT,
        vulgar_synomaly TEXT,
        scientific_name TEXT,
        family TEXT,
        botanical_description TEXT,
        habitat TEXT,
        chemical_composition TEXT,
        sync_status TEXT DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000)
      );
    ''');
  }
}
