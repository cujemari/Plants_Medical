import 'package:app_plants/domain/entities/medicinal_plant.dart';
import 'package:app_plants/domain/repositories/plant_repository.dart';

class GetMedicinalById {
  final PlantRepository repository;

  GetMedicinalById(this.repository);

  Future<MedicinalPlant?> call(int id) => repository.getPlantaById(id);
}
