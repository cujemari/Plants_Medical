import 'package:json_annotation/json_annotation.dart';
import 'package:app_plants/domain/entities/disease.dart';

part 'disease_model.g.dart';

@JsonSerializable()
class DiseaseModel extends Disease {
  @JsonKey(name: 'disease_id')
  final int diseaseId;

  @JsonKey(name: 'name_disease')
  final String namedisease;

  @JsonKey(name: 'image_disease')
  final String imagedisease;

  @JsonKey(name: 'description_disease')
  final String descriptiondisease;

  final String symptoms;

  @JsonKey(name: 'sync_status')
  final String syncstatus;

  @JsonKey(name: 'last_updated')
  final int lastupdated;

  DiseaseModel({
    required this.diseaseId,
    required this.namedisease,
    required this.imagedisease,
    required this.descriptiondisease,
    required this.symptoms,
    required this.syncstatus,
    required this.lastupdated,
  }) : super(
         diseaseId: diseaseId,
         namedisease: namedisease,
         imagedisease: imagedisease,
         descriptiondisease: descriptiondisease,
         symptoms: symptoms,
         syncstatus: syncstatus,
         lastupdated: lastupdated,
       );

  /// Para Retrofit (JSON)
  factory DiseaseModel.fromJson(Map<String, dynamic> json) =>
      _$DiseaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiseaseModelToJson(this);

  /// Para SQLite (base de datos local)
  factory DiseaseModel.fromMap(Map<String, dynamic> map) {
    return DiseaseModel(
      diseaseId: map['disease_id'],
      namedisease: map['name_disease'],
      imagedisease: map['image_disease'],
      descriptiondisease: map['description_disease'],
      symptoms: map['symptoms'],
      syncstatus: map['sync_status'],
      lastupdated: map['last_updated'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'disease_id': diseaseId,
      'name_disease': namedisease,
      'image_disease': imagedisease,
      'description_disease': descriptiondisease,
      'symptoms': symptoms,
      'sync_status': syncstatus,
      'last_updated': lastupdated,
    };
  }
}
