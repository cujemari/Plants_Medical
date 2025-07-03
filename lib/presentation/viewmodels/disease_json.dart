import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:app_plants/data/models/disease_model.dart';
import 'package:app_plants/data/repositories/disease_repository_impl.dart';

class DiseaseJson {
  final _repository = DiseaseRepositoryImpl();

  Future<List<DiseaseModel>> cargarEnfermedadesDesdeJson() async {
    final String response = await rootBundle.loadString(
      'assets/data/diseases.json',
    );
    final List<dynamic> data = jsonDecode(response);

    List<DiseaseModel> lista = [];

    for (final item in data) {
      final disease = DiseaseModel.fromJson(item);

      if (!kIsWeb) {
        await _repository.insertarEnfermedad(disease);
      }
    }

    print("✅ Enfermedades cargadas local y remotamente");
    return lista;
  }
}
