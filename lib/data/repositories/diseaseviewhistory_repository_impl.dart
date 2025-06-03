import 'package:sqflite/sqflite.dart';

class DiseaseviewhistoryRepositoryImpl {
  final Database db;

  DiseaseviewhistoryRepositoryImpl(this.db);

  // Insertar registro de visualización de enfermedad por usuario
  Future<int> insertView({
    required int userId,
    required int diseaseId,
    String syncStatus = 'pending',
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    return await db.insert(
      'disease_view_history',
      {
        'user_id': userId,
        'disease_id': diseaseId,
        'fecha_vista': now,
        'sync_status': syncStatus,
        'last_updated': now,
      },
      conflictAlgorithm:
          ConflictAlgorithm.replace, // reemplaza si ya existe, opcional
    );
  }

  // Obtener todas las visualizaciones, opcionalmente por usuario
  Future<List<Map<String, dynamic>>> getAllViews({int? userId}) async {
    if (userId != null) {
      return await db.query(
        'disease_view_history',
        where: 'user_id = ?',
        whereArgs: [userId],
        orderBy: 'fecha_vista DESC',
      );
    } else {
      return await db.query(
        'disease_view_history',
        orderBy: 'fecha_vista DESC',
      );
    }
  }
}
