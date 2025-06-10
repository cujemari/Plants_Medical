import '../entities/disease.dart';

abstract class DiseaseRepository {
  Future<Disease?> getDiseaseById(int id);
}
