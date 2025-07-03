import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/disease_plant_use_table.dart';
import 'package:app_plants/data/models/disease_plant_use_model.dart';

Future<void> consultarUsoPreparacionEnConsola() async {
  final db = await LocalDatabase().database;
  final List<Map<String, dynamic>> maps = await db.query(
    DiseasePlantUseTable.tableName,
  );

  if (maps.isEmpty) {
    print('No hay usos registrados.');
    return;
  }

  print('Usos y preparaciones registrados en la base de datos:\n');

  for (var map in maps) {
    final uso = DiseasePlantUseModel.fromMap(map);
    print('''
ID: ${uso.diseplantId}
- id_disease: ${uso.diseaseId}
- id_plant: ${uso.plantId}
- Uso: ${uso.use}
- Preparación: ${uso.preparation}
- Indicación: ${uso.indication}
''');
  }
}
