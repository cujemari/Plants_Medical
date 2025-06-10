import 'package:app_plants/domain/repositories/disease_repository.dart';
import '../entities/disease.dart';

class GetDiseaseById {
  final DiseaseRepository repository;

  GetDiseaseById(this.repository);

  Future<Disease?> call(int id) => repository.getDiseaseById(id);
}
