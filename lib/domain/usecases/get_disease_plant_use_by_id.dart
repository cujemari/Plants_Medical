import 'package:app_plants/domain/entities/disease_plant_use.dart';
import 'package:app_plants/domain/repositories/disease_plant_use_repository.dart';

class GetDiseasePlantUseById {
  final DiseasePlantUseRepository repository;

  GetDiseasePlantUseById(this.repository);

  Future<DiseasePlantUse?> call(int id) {
    return repository.getById(id);
  }
}
