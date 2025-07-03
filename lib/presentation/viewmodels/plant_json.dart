import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/plant_repository_impl.dart';

class PlantJson {
  final _repository = PlantRepositoryImpl();

  Future<List<MedicinalPlantModel>> cargarPlantasDesdeJson() async {
    final String response = await rootBundle.loadString(
      'assets/data/plants.json',
    );
    final List<dynamic> data = jsonDecode(response);

    List<MedicinalPlantModel> lista = [];

    for (final item in data) {
      final planta = MedicinalPlantModel.fromJson(item);

      // Insertar local si no es Web
      if (!kIsWeb) {
        await _repository.insertarPlanta(planta);
      }
    }

    print("✅ Plantas cargadas local y remotamente");

    return lista;
  }
}
