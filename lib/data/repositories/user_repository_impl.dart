import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/models/user_model.dart';

class UserRepositoryImpl {
  // Insertar o actualizar usuario según el email
  Future<void> insertarOActualizarUsuario(
    UserModel usuario, {
    bool esOffline = false,
  }) async {
    final db = await LocalDatabase().database;

    final result = await db.query(
      'user',
      where: 'email = ?',
      whereArgs: [usuario.email],
    );

    final nuevoUsuario = usuario.copyWith(
      isOffline: esOffline,
      syncStatus: 'pending',
      lastUpdated: DateTime.now().millisecondsSinceEpoch,
    );

    if (result.isEmpty) {
      // Insertar nuevo usuario
      await db.insert('user', nuevoUsuario.toMap());
    } else {
      // Actualizar usuario existente
      await db.update(
        'user',
        nuevoUsuario.toMap(),
        where: 'email = ?',
        whereArgs: [usuario.email],
      );
    }
  }

  // Obtener usuario por ID
  Future<UserModel?> getUsuarioById(int id) async {
    final db = await LocalDatabase().database;
    final result = await db.query(
      'user',
      where: 'user_id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return UserModel.fromMap(
        result.first,
      ); // CORREGIDO: de fromJson a fromMap
    }
    return null;
  }

  // Obtener usuario por email
  Future<UserModel?> getUsuarioPorEmail(String email) async {
    final db = await LocalDatabase().database;
    final result = await db.query(
      'user',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (result.isNotEmpty) {
      return UserModel.fromMap(
        result.first,
      ); // CORREGIDO: de fromJson a fromMap
    }
    return null;
  }

  // Obtener todos los usuarios
  Future<List<UserModel>> getAllUsuarios() async {
    final db = await LocalDatabase().database;
    final result = await db.query('user');
    return result.map((row) => UserModel.fromMap(row)).toList(); // CORREGIDO
  }

  // Actualizar usuario por ID
  Future<int> updateUsuario(UserModel usuario) async {
    final db = await LocalDatabase().database;
    return await db.update(
      'user',
      usuario.toMap(),
      where: 'user_id = ?',
      whereArgs: [usuario.userId],
    );
  }

  // Eliminar usuario por ID
  Future<int> deleteUsuario(int id) async {
    final db = await LocalDatabase().database;
    return await db.delete('user', where: 'user_id = ?', whereArgs: [id]);
  }
}
