import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/models/disease_model.dart';

Future<void> consultarDiseaseEnConsola() async {
  final db = await LocalDatabase().database;
  final List<Map<String, dynamic>> maps = await db.query('disease');

  if (maps.isEmpty) {
    print('📭 No hay enfermedades registradas en la base de datos.');
    return;
  }

  print('🧾 Enfermedades registradas en la base de datos:\n');

  for (var map in maps) {
    final disease = DiseaseModel.fromJson(map);
    final info = StringBuffer()
      ..writeln('ID: ${disease.diseaseId}')
      ..writeln('Nombre: ${disease.namedisease}')
      ..writeln('Imagen: ${disease.imagedisease}')
      ..writeln('Descripción: ${disease.descriptiondisease}')
      ..writeln('Síntomas: ${disease.symptoms}');

    print(info.toString());
  }
}
