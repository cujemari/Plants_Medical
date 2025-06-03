import 'package:sqflite/sqflite.dart';

class UserDiseaseTable {
  static Future<void> createTable(Database db) async {
    // Relación usuario-enfermedad
    await db.execute('''
      CREATE TABLE user_disease (
        userdisease_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        disease_id INTEGER,
        sync_status TEXT DEFAULT 'pending',
        last_updated INTEGER NOT NULL DEFAULT (strftime('%s','now') * 1000),
        FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY (disease_id) REFERENCES disease(disease_id) ON DELETE CASCADE
      );
    ''');

    await db.execute('CREATE INDEX idx_plant_name ON plant(name_plant);');
  }
}
