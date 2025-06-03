import 'package:sqflite/sqflite.dart';

class DiseaseTable {
  static const String tablename = "disease";
  static Future<void> createTable(Database db) async {
    // Tabla de enfermedades
    await db.execute('''
      CREATE TABLE $tablename (
        disease_id INTEGER PRIMARY KEY,
        name_disease TEXT,
        image_disease TEXT,
        description_disease TEXT,
        symptoms TEXT,
        sync_status TEXT DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000)
      );
    ''');
  }
}
