import 'dart:convert';
import 'package:app_plants/data/models/disease_model.dart';
import 'package:app_plants/data/repositories/disease_repository_impl.dart';
import 'package:flutter/services.dart';

class DiseaseViewmodel {
  final _repository = DiseaseRepositoryImpl();

  Future<void> cargarEnfermedadesDesdeJson() async {
    final String response = await rootBundle.loadString(
      'assets/data/diseases.json',
    );
    final List<dynamic> data = jsonDecode(response);

    for (final item in data) {
      final disease = DiseaseModel.fromJson(item);
      await _repository.insertarEnfermedad(disease);
    }
  }
}
