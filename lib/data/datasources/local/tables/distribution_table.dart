import 'package:sqflite/sqflite.dart';

class DistributionTable {
  static const String tablename = "geographic_distribution";
  static Future<void> createTable(Database db) async {
    // Distribución geográfica de plantas
    await db.execute('''
      CREATE TABLE $tablename (
        distribution_id INTEGER PRIMARY KEY,
        plant_id INTEGER,
        image_map TEXT,
        description_distribution TEXT,
        sync_status TEXT DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000),
        FOREIGN KEY (plant_id) REFERENCES plant(plant_id) ON DELETE CASCADE
      );
    ''');
  }
}
