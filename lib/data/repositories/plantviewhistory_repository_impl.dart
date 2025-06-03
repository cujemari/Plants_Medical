import 'package:sqflite/sqflite.dart';

class PlantviewhistoryRepositoryImpl {
  final Database db;

  PlantviewhistoryRepositoryImpl(this.db);

  // Insertar un registro de visualización de planta por usuario
  Future<int> insertView({
    required int userId,
    required int plantId,
    String syncStatus = 'pending',
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    return await db.insert(
      'plant_view_history',
      {
        'user_id': userId,
        'plant_id': plantId,
        'fecha_vista': now,
        'sync_status': syncStatus,
        'last_updated': now,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
      // Si quieres evitar registros duplicados para la misma planta y usuario al mismo tiempo,
      // considera agregar una restricción única o lógica extra para evitar duplicados.
    );
  }

  // Obtener todas las visualizaciones, opcionalmente por usuario
  Future<List<Map<String, dynamic>>> getAllViews({int? userId}) async {
    if (userId != null) {
      return await db.query(
        'plant_view_history',
        where: 'user_id = ?',
        whereArgs: [userId],
        orderBy: 'fecha_vista DESC',
      );
    } else {
      return await db.query('plant_view_history', orderBy: 'fecha_vista DESC');
    }
  }

  // Eliminar registro por plantviewhistory_id
  Future<int> deleteViewById(int plantViewHistoryId) async {
    return await db.delete(
      'plant_view_history',
      where: 'plantviewhistory_id = ?',
      whereArgs: [plantViewHistoryId],
    );
  }

  // Opcional: eliminar todas las visualizaciones de un usuario
  Future<int> deleteViewsByUserId(int userId) async {
    return await db.delete(
      'plant_view_history',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }
}
