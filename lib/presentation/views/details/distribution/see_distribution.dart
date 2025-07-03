import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/models/distribution_model.dart';

Future<void> consultarDistribucionGeograficaEnConsola() async {
  final db = await LocalDatabase().database;
  final maps = await db.query('distributiongeografig');

  if (maps.isEmpty) {
    print('⚠️ No hay registros de distribución geográfica.');
    return;
  }

  print('📍 Distribuciones geográficas registradas:');
  for (final map in maps) {
    final distribucion = DistributionModel.fromMap(map);
    print('''
    ID Distribución: ${distribucion.distributionId}
    ID Planta: ${distribucion.plantId}
    Imagen: ${distribucion.imagenmap}
    Descripción: ${distribucion.descriptiondistribution}

''');
  }
}
