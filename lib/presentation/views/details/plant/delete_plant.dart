import 'package:app_plants/data/datasources/local/local_database.dart';

Future<void> eliminarPlanta(int id) async {
  try {
    final db = await LocalDatabase().database;
    await db.delete('plant', where: 'plant_id = ?', whereArgs: [id]);
    print('Planta eliminada correctamente');
  } catch (e) {
    print('Error al eliminar planta: $e');
  }
}
