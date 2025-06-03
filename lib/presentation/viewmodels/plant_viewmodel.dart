import 'dart:convert';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:flutter/services.dart';
import 'package:app_plants/data/repositories/plant_repository_impl.dart';

class PlantViewModel {
  final _repository = PlantRepositoryImpl();

  Future<void> cargarPlantasDesdeJson() async {
    final String response = await rootBundle.loadString(
      'assets/data/plants.json',
    );
    final List<dynamic> data = jsonDecode(response);

    for (final item in data) {
      final planta = MedicinalPlantModel.fromJson(item);
      await _repository.insertarPlanta(planta);
    }
  }
}
