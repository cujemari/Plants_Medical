import 'package:app_plants/domain/entities/Distribution.dart';

abstract class GeographicDistributionRepository {
  Future<void> insertDistribucion(Distribution distribucion);
  Future<Distribution?> getDistribucionById(int id);
  Future<List<Distribution>> getAllDistribuciones();
}
