import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/models/disease_model.dart';

Future<void> consultarDiseaseEnConsola() async {
  final db = await LocalDatabase().database;

  final List<Map<String, dynamic>> maps = await db.query('disease');

  if (maps.isEmpty) {
    print('No hay enfermedades registradas.');
    return;
  }

  print('Enfermedades registradas en la base de datos:');
  for (var map in maps) {
    final disease = DiseaseModel.fromMap(map);
    print(
      'ID: ${disease.diseaseId}, '
      'Nombre: ${disease.namedisease}, '
      'Imagen: ${disease.imagedisease}, '
      'Description: ${disease.descriptiondisease}, '
      'syntomas: ${disease.symptoms}, ',
    );
  }
}
