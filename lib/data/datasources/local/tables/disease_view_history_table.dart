import 'package:sqflite/sqflite.dart';

class DiseaseViewHistoryTable {
  static Future<void> createTable(Database db) async {
    // Historial de enfermedades vistas
    await db.execute('''
      CREATE TABLE disease_view_history (
        diseaseviewhistory_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        disease_id INTEGER,
        fecha_vista INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000),
        sync_status TEXT DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000),
        FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY (disease_id) REFERENCES disease(disease_id) ON DELETE CASCADE
      );
    ''');
  }
}
