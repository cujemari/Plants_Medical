import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/favoriteplant_repository_impl.dart';
import 'package:flutter/material.dart';

class FavoritesViewModel extends ChangeNotifier {
  final FavoriteplantRepositoryImpl _repository;

  FavoritesViewModel(this._repository);

  List<MedicinalPlantModel> _favorites = [];
  bool _isLoading = true;

  List<MedicinalPlantModel> get favorites => _favorites;
  bool get isLoading => _isLoading;

  Future<void> loadFavorites() async {
    _isLoading = true;
    notifyListeners();

    final ids = await _repository.getFavorites();
    final plants = <MedicinalPlantModel>[];

    for (var id in ids) {
      final plant = await _repository.getPlantById(id);
      if (plant != null) plants.add(plant);
    }

    _favorites = plants;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> removeFavorite(int plantId) async {
    await _repository.removeFavorite(plantId);
    await loadFavorites();
  }
}
