import 'package:app_plants/data/repositories/distribution_repository_impl.dart';
import 'package:app_plants/domain/entities/Distribution.dart';

class GetAllDistributionsUseCase {
  final DistributionRepositoryImpl repository;

  GetAllDistributionsUseCase(this.repository);

  Future<List<Distribution>> call() {
    return repository.getAllDistribuciones();
  }
}
