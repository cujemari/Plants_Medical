// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_plant_use_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiseasePlantUseModel _$DiseasePlantUseModelFromJson(
  Map<String, dynamic> json,
) => DiseasePlantUseModel(
  diseplantId: (json['diseplant_id'] as num).toInt(),
  diseaseId: (json['disease_id'] as num).toInt(),
  plantId: (json['plant_id'] as num?)?.toInt(),
  use: json['use'] as String,
  preparation: json['preparation'] as String,
  indication: json['indication'] as String,
  syncstatus: json['sync_status'] ?? 'pending',
  lastupdated: json['last_updated'] is int
      ? json['last_updated']
      : DateTime.now().millisecondsSinceEpoch,
);

Map<String, dynamic> _$DiseasePlantUseModelToJson(
  DiseasePlantUseModel instance,
) => <String, dynamic>{
  'diseplant_id': instance.diseplantId,
  'disease_id': instance.diseaseId,
  'plant_id': instance.plantId,
  'use': instance.use,
  'preparation': instance.preparation,
  'indication': instance.indication,
  'sync_status': instance.syncstatus,
  'last_updated': instance.lastupdated,
};
