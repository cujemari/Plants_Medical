abstract class PlantRepository {
  Future<bool> isPlantFavorite(int plantId);
  Future<void> addFavorite(int plantId);
  Future<void> removeFavorite(int plantId);
}
