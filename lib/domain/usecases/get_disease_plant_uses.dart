import 'package:app_plants/domain/entities/disease_plant_use.dart';
import 'package:app_plants/domain/repositories/disease_plant_use_repository.dart';

class GetDiseasePlantUses {
  final DiseasePlantUseRepository repository;

  GetDiseasePlantUses(this.repository);

  Future<List<DiseasePlantUse>> call() {
    return repository.getAll();
  }
}
