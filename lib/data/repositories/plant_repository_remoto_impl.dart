import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/domain/repositories/plant_repositiry_remoto.dart';
import 'package:app_plants/data/datasources/remota/plant_remote_data_source.dart';

class PlantRepositoryRemotoImpl implements PlantRepositiryRemoto {
  final PlantRemoteDataSource remoteDataSource;

  PlantRepositoryRemotoImpl({required this.remoteDataSource});

  @override
  Future<List<MedicinalPlantModel>> getPlantas() async {
    return await remoteDataSource.getPlantasMedicinales();
  }
}
