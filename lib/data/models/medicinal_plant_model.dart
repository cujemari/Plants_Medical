import 'package:json_annotation/json_annotation.dart';
import 'package:app_plants/domain/entities/medicinal_plant.dart';

part 'medicinal_plant_model.g.dart';

@JsonSerializable()
class MedicinalPlantModel extends MedicinalPlant {
  MedicinalPlantModel({
    required int plantId,
    required String nameplant,
    required String imageplant,
    required String vulgarsynomaly,
    required String cientificname,
    required String family,
    required String botanicaldescription,
    required String habitat,
    required String chemicalcomposition,
    required String syncStatus,
    required int lastUpdated,
  }) : super(
         plantId: plantId,
         nameplant: nameplant,
         imageplant: imageplant,
         vulgarsynomaly: vulgarsynomaly,
         cientificname: cientificname,
         family: family,
         botanicaldescription: botanicaldescription,
         habitat: habitat,
         chemicalcomposition: chemicalcomposition,
         syncStatus: syncStatus,
         lastUpdated: lastUpdated,
       );

  //Para Retrofit / JSON
  factory MedicinalPlantModel.fromJson(Map<String, dynamic> json) =>
      _$MedicinalPlantModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicinalPlantModelToJson(this);

  //Para SQLite
  factory MedicinalPlantModel.fromMap(Map<String, dynamic> map) {
    return MedicinalPlantModel(
      plantId: map['plant_id'],
      nameplant: map['name_plant'],
      imageplant: map['image_plant'],
      vulgarsynomaly: map['vulgar_synomaly'],
      cientificname: map['scientific_name'],
      family: map['family'],
      botanicaldescription: map['botanical_description'],
      habitat: map['habitat'],
      chemicalcomposition: map['chemical_composition'],
      syncStatus: map['sync_status'],
      lastUpdated: map['last_updated'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'plant_id': plantId,
      'name_plant': nameplant,
      'image_plant': imageplant,
      'vulgar_synomaly': vulgarsynomaly,
      'scientific_name': cientificname,
      'family': family,
      'botanical_description': botanicaldescription,
      'habitat': habitat,
      'chemical_composition': chemicalcomposition,
      'sync_status': syncStatus,
      'last_updated': lastUpdated,
    };
  }
}
