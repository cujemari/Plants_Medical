import 'dart:convert';
import 'package:app_plants/data/models/Geographic_distribution_model.dart';
import 'package:app_plants/data/repositories/geographicdistribution_repository_impl.dart';
import 'package:flutter/services.dart';

class DistributionViewmodel {
  final _repository = GeographicDistributionRepositoryImpl();

  Future<void> cargarDistribucionDesdeJson() async {
    final String response = await rootBundle.loadString(
      'assets/data/distribution.json',
    );
    final List<dynamic> data = jsonDecode(response);

    for (final item in data) {
      final distribution = DistributionModel.fromJson(item);
      await _repository.insertarDistribucion(distribution);
    }
  }
}
