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
    _setLoading(true);

    try {
      final result = await _getDiseaseById(id);
      _disease = result;
      _error = result == null ? "No encontrada" : null;
    } catch (e) {
      _error = "Error: $e";
      _disease = null;
    }

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
