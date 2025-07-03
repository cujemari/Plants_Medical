// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiseaseModel _$DiseaseModelFromJson(Map<String, dynamic> json) => DiseaseModel(
  diseaseId: (json['disease_id'] as num).toInt(),
  namedisease: json['name_disease'] as String,
  imagedisease: json['image_disease'] as String,
  descriptiondisease: json['description_disease'] as String,
  symptoms: json['symptoms'] as String,
  syncstatus: json['sync_status'] ?? 'pending',
  lastupdated: json['last_updated'] is int
      ? json['last_updated']
      : DateTime.now().millisecondsSinceEpoch,
);

Map<String, dynamic> _$DiseaseModelToJson(DiseaseModel instance) =>
    <String, dynamic>{
      'disease_id': instance.diseaseId,
      'name_disease': instance.namedisease,
      'image_disease': instance.imagedisease,
      'description_disease': instance.descriptiondisease,
      'symptoms': instance.symptoms,
      'sync_status': instance.syncstatus,
      'last_updated': instance.lastupdated,
    };
