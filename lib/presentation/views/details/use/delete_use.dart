import 'package:app_plants/data/datasources/local/local_database.dart';

Future<void> eliminaruso(int id) async {
  try {
    final db = await LocalDatabase().database;
    await db.delete(
      'disease_plant_use',
      where: 'diseplant_id = ?',
      whereArgs: [id],
    );
    print('Planta eliminada correctamente');
  } catch (e) {
    print('Error al eliminar use: $e');
  }
}
