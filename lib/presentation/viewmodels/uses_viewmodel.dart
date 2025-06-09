import 'dart:convert';
import 'package:app_plants/data/models/disease_plant_use_model.dart';
import 'package:app_plants/data/repositories/preparationuse_repository_impl.dart';
import 'package:flutter/services.dart';

class UsesViewmodel {
  final _repository = PreparationuseRepositoryImpl();

  Future<void> cargarUsopreparacionDesdeJson() async {
    final String response = await rootBundle.loadString(
      'assets/data/uses.json',
    );
    final List<dynamic> data = jsonDecode(response);

    for (final item in data) {
      final preparation = DiseasePlantUseModel.fromJson(item);
      await _repository.insertarPreparationUse(preparation);
    }
  }
}
