import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/preparation_use_table.dart';
import 'package:app_plants/data/models/preparation_use_model.dart';

Future<void> consultarUsoPreparacionEnConsola() async {
  final db = await LocalDatabase().database;

  final List<Map<String, dynamic>> maps = await db.query(UseTable.tableName);

  if (maps.isEmpty) {
    print('No hay usos registrados.');
    return;
  }

  print('Usos y preparaciones registrados en la base de datos:');
  for (var map in maps) {
    final uso = PreparationUseModel.fromMap(map);
    print(
      'ID: ${uso.preparationuseId}, '
      'id_plant: ${uso.plantId}, '
      'uso: ${uso.use}, '
      'Preparación: ${uso.preparation}, '
      'Indicación: ${uso.indication}',
    );
  }
}
