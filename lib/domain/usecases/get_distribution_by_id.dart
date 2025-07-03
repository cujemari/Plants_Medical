import 'package:app_plants/data/repositories/distribution_repository_impl.dart';
import 'package:app_plants/domain/entities/Distribution.dart';

class GetDistributionByIdUseCase {
  final DistributionRepositoryImpl repository;

  GetDistributionByIdUseCase(this.repository);

  Future<Distribution?> call(int id) {
    return repository.getDistribucionById(id);
  }
}
