import 'package:flutter/material.dart';
import '../../domain/entities/disease.dart';
import '../../domain/usecases/get_disease_by_id.dart';

class DiseaseViewModel extends ChangeNotifier {
  final GetDiseaseById _getDiseaseById;

  Disease? _disease;
  bool _isLoading = false;
  String? _error;

  Disease? get disease => _disease;
  bool get isLoading => _isLoading;
  String? get error => _error;

  DiseaseViewModel(this._getDiseaseById);

  Future<void> fetchDisease(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _disease = await _getDiseaseById(id);
      _error = _disease == null ? "No encontrada" : null;
    } catch (e) {
      _error = "Error: $e";
    }

    _isLoading = false;
    notifyListeners();
  }
}
