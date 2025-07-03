import 'package:app_plants/domain/entities/disease_plant_use.dart';

abstract class DiseasePlantUseRepository {
  Future<List<DiseasePlantUse>> getAll();
  Future<DiseasePlantUse?> getById(int id);
}
