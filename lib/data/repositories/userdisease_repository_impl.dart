import 'package:sqflite/sqflite.dart';

class UserdiseaseRepositoryImpl {
  final Database db;

  UserdiseaseRepositoryImpl(this.db);

  // Insertar relación usuario-enfermedad
  Future<int> insertUserDisease({
    required int userId,
    required int diseaseId,
    String syncStatus = 'pending',
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    return await db.insert(
      'user_disease',
      {
        'user_id': userId,
        'disease_id': diseaseId,
        'sync_status': syncStatus,
        'last_updated': now,
      },
      conflictAlgorithm:
          ConflictAlgorithm.ignore, // evita duplicados si quieres
    );
  }

  // Eliminar relación por userdisease_id o por user_id y disease_id
  Future<int> deleteUserDiseaseById(int userDiseaseId) async {
    return await db.delete(
      'user_disease',
      where: 'userdisease_id = ?',
      whereArgs: [userDiseaseId],
    );
  }

  Future<int> deleteUserDisease({
    required int userId,
    required int diseaseId,
  }) async {
    return await db.delete(
      'user_disease',
      where: 'user_id = ? AND disease_id = ?',
      whereArgs: [userId, diseaseId],
    );
  }

  // Obtener todas las enfermedades de un usuario (retorna lista de maps)
  Future<List<Map<String, dynamic>>> getDiseasesByUserId(int userId) async {
    return await db.query(
      'user_disease',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }
}
