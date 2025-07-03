/*import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';

part 'plant_api.g.dart';

@RestApi(baseUrl: 'https://tuservidor.com/api') 
abstract class PlantApi {
  factory PlantApi(Dio dio, {String baseUrl}) = _PlantApi;

  @GET('/plants')
  Future<List<MedicinalPlantModel>> getAllPlants();

  @GET('/plants/{id}')
  Future<MedicinalPlantModel> getPlantById(@Path('id') int id);
}*/
