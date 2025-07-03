import 'package:app_plants/domain/entities/medicinal_plant.dart';
import 'package:app_plants/domain/repositories/plant_repositiry_remoto.dart';
import 'package:flutter/material.dart';

class PlantRemotoViewModel extends ChangeNotifier {
  final PlantRepositiryRemoto repository;

  List<MedicinalPlant> _plantas = [];
  List<MedicinalPlant> get plantas => _plantas;

  PlantRemotoViewModel({required this.repository});

  Future<void> cargarPlantas() async {
    _plantas = await repository.getPlantas();
    notifyListeners();
  }
}
