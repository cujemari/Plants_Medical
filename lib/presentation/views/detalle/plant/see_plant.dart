import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';

Future<void> consultarPlantasEnConsola() async {
  final db = await LocalDatabase().database;

  final List<Map<String, dynamic>> maps = await db.query('plant');

  if (maps.isEmpty) {
    print('No hay plantas registradas.');
    return;
  }

  print('Plantas registradas en la base de datos:');
  for (var map in maps) {
    final planta = MedicinalPlantModel.fromMap(map);
    print(
      'ID: ${planta.plantId}, Nombre: ${planta.nameplant},image: ${planta.imageplant}, vulgar: ${planta.vulgarsynomaly},nomb_cientf: ${planta.cientificname},family: ${planta.family},description: ${planta.botanicaldescription},habitat: ${planta.habitat},comp_quimico: ${planta.chemicalcomposition}',
    );
  }
}
