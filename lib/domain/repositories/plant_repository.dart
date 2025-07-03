import 'package:app_plants/domain/entities/medicinal_plant.dart';

abstract class PlantRepository {
  Future<List<MedicinalPlant?>> getPlantas(int id);
  Future<MedicinalPlant?> getPlantaById(int id);
  Future<void> insertarPlanta(MedicinalPlant planta);
  Future<int> updatePlant(MedicinalPlant planta);
  Future<int> deletePlant(int id);
  Future<bool> isPlantFavorite(int plantId);
  Future<void> addFavorite(int plantId);
  Future<void> removeFavorite(int plantId);
}
