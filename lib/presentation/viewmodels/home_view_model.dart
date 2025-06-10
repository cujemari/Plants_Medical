import 'package:flutter/material.dart';
import '../../domain/entities/medicinal_plant.dart';
import '../../domain/repositories/plant_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final PlantRepository repository;

  HomeViewModel({required this.repository});

  List<MedicinalPlant> _plants = [];
  bool _isLoading = true;
  int _currentIndex = 0;

  List<MedicinalPlant> get plants => _plants;
  bool get isLoading => _isLoading;
  int get currentIndex => _currentIndex;

  Future<void> loadPlants() async {
    _isLoading = true;
    notifyListeners();
    try {
      _plants = await repository.getPlantas(); // <- método correcto
    } catch (e) {
      _plants = [];
      debugPrint('Error cargando plantas: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<int> visibleIndicators() {
    int total = _plants.length;
    int maxVisible = 5;
    if (total <= maxVisible) return List.generate(total, (i) => i);
    int start = _currentIndex - (maxVisible ~/ 2);
    if (start < 0) start = 0;
    if (start + maxVisible > total) start = total - maxVisible;
    return List.generate(maxVisible, (i) => start + i);
  }
}
