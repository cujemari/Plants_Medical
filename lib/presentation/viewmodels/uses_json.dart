import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:app_plants/data/models/disease_plant_use_model.dart';
import 'package:app_plants/data/repositories/preparationuse_repository_impl.dart';

class UsesJson {
  final _repository = PreparationuseRepositoryImpl();

  Future<List<DiseasePlantUseModel>> cargarUsosDesdeJson() async {
    final String response = await rootBundle.loadString(
      'assets/data/uses.json',
    );
    final List<dynamic> data = jsonDecode(response);

    List<DiseasePlantUseModel> lista = [];

    for (final item in data) {
      final preparation = DiseasePlantUseModel.fromJson(item);

      // Insertar en SQLite si no es Web
      if (!kIsWeb) {
        await _repository.insertarPreparationUse(preparation);
      }
    }

    print("✅ Usos cargados local y remotamente.");
    return lista;
  }
}
