import 'package:sqflite/sqflite.dart';

class SettingRepositoryImpl {
  final Database db;

  SettingRepositoryImpl(this.db);

  // Actualizar configuraciones completas de un usuario (por user_id)
  Future<int> updateSettings({
    required int userId,
    required int darkMode,
    required String termsConditions,
    required String credits,
    String syncStatus = 'pending',
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    return await db.update(
      'setting',
      {
        'dark_mode': darkMode,
        'terms_conditions': termsConditions,
        'credits': credits,
        'sync_status': syncStatus,
        'last_updated': now,
      },
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  // Actualizar campos específicos (opcional)
  Future<int> updatePartialSettings(
    int userId, {
    int? darkMode,
    String? termsConditions,
    String? credits,
    String? syncStatus,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    Map<String, dynamic> fieldsToUpdate = {'last_updated': now};

    if (darkMode != null) fieldsToUpdate['dark_mode'] = darkMode;
    if (termsConditions != null)
      fieldsToUpdate['terms_conditions'] = termsConditions;
    if (credits != null) fieldsToUpdate['credits'] = credits;
    if (syncStatus != null) fieldsToUpdate['sync_status'] = syncStatus;

    return await db.update(
      'setting',
      fieldsToUpdate,
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }
}
