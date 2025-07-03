// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicinal_plant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicinalPlantModel _$MedicinalPlantModelFromJson(Map<String, dynamic> json) =>
    MedicinalPlantModel(
      plantId: (json['plant_id'] as num).toInt(),
      nameplant: json['name_plant'] as String,
      imageplant: json['image_plant'] as String,
      vulgarsynomaly: json['vulgar_synomaly'] as String,
      cientificname: json['scientific_name'] as String,
      family: json['family'] as String,
      botanicaldescription: json['botanical_description'] as String,
      habitat: json['habitat'] as String,
      chemicalcomposition: json['chemical_composition'] as String,
      syncStatus: json['sync_status'] ?? 'pending',
      lastUpdated: json['last_updated'] is int
          ? json['last_updated']
          : DateTime.now().millisecondsSinceEpoch,
    );

Map<String, dynamic> _$MedicinalPlantModelToJson(
  MedicinalPlantModel instance,
) => <String, dynamic>{
  'plant_id': instance.plantId,
  'name_plant': instance.nameplant,
  'image_plant': instance.imageplant,
  'vulgar_synomaly': instance.vulgarsynomaly,
  'scientific_name': instance.cientificname,
  'family': instance.family,
  'botanical_description': instance.botanicaldescription,
  'habitat': instance.habitat,
  'chemical_composition': instance.chemicalcomposition,
  'sync_status': instance.syncStatus,
  'last_updated': instance.lastUpdated,
};
