import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/models/Geographic_distribution_model.dart';

Future<void> consultarDistribucionGeograficaEnConsola() async {
  final db = await LocalDatabase().database;

  final List<Map<String, dynamic>> maps = await db.query(
    'distributiongeografig',
  );

  if (maps.isEmpty) {
    print('No hay registros de distribución geográfica.');
    return;
  }

  print('Distribuciones geográficas registradas en la base de datos:');
  for (var map in maps) {
    final distribucion = DistributionModel.fromMap(map);
    print(
      'ID: ${distribucion.distributionId}, '
      'ID Planta: ${distribucion.plantId}, '
      'Imagen Mapa: ${distribucion.imagenmap}, '
      'Descripción: ${distribucion.descriptiondistribution}, ',
    );
  }
}
