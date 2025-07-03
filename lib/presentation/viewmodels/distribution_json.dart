import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';

import 'package:app_plants/data/models/distribution_model.dart';
import 'package:app_plants/data/repositories/distribution_repository_impl.dart';

class DistributionJson {
  final _repository = DistributionRepositoryImpl();

  Future<List<DistributionModel>> cargarDistribucion() async {
    final String response = await rootBundle.loadString(
      'assets/data/distribution.json',
    );
    final List<dynamic> data = jsonDecode(response);

    List<DistributionModel> lista = [];

    for (final item in data) {
      final distribution = DistributionModel.fromJson(item);

      // Guardar localmente si no es Web
      if (!kIsWeb) {
        await _repository.insertarDistribucion(distribution);
      }
    }

    print("✅ Distribuciones cargadas local y remotamente.");
    return lista;
  }
}
