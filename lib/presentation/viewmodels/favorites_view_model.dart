import 'package:flutter/material.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/favoriteplant_repository_impl.dart';

class FavoritesViewModel extends ChangeNotifier {
  final FavoriteplantRepositoryImpl _repository;

  FavoritesViewModel(this._repository) {
    loadFavorites(); // Cargar automáticamente al inicializar
  }

  List<MedicinalPlantModel> _favorites = [];
  bool _isLoading = true;

  List<MedicinalPlantModel> get favorites => _favorites;
  bool get isLoading => _isLoading;

  /// Cargar favoritos desde la base de datos
  Future<void> loadFavorites() async {
    _isLoading = true;
    notifyListeners();

    try {
      final ids = await _repository.getFavorites();
      final plants = <MedicinalPlantModel>[];

      for (var id in ids) {
        final plant = await _repository.getPlantById(id);
        if (plant != null) {
          plants.add(plant);
        }
      }

      _favorites = plants;
    } catch (e) {
      debugPrint("Error cargando favoritos: $e");
      _favorites = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Eliminar favorito y recargar lista
  Future<void> removeFavorite(int plantId) async {
    await _repository.removeFavorite(plantId);
    await loadFavorites();
  }

  /// Agregar favorito y recargar lista
  Future<void> addFavorite(int plantId) async {
    await _repository.addFavorite(plantId);
    await loadFavorites();
  }

  /// Verificar si una planta está marcada como favorita
  bool isFavorite(int plantId) {
    return _favorites.any((plant) => plant.plantId == plantId);
  }
}
