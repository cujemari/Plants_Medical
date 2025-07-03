import 'package:app_plants/data/datasources/remota/plant_remote_data_source.dart';
import 'package:app_plants/domain/entities/medicinal_plant.dart';

class PlantRepositiryRemoto {
  final PlantRemoteDataSource remoteDataSource;

  PlantRepositiryRemoto({required this.remoteDataSource});

  Future<List<MedicinalPlant>> getPlantas() {
    return remoteDataSource.getPlantasMedicinales();
  }
}
