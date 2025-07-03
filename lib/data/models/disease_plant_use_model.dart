import 'package:json_annotation/json_annotation.dart';
import 'package:app_plants/domain/entities/disease_plant_use.dart';

part 'disease_plant_use_model.g.dart';

@JsonSerializable()
class DiseasePlantUseModel extends DiseasePlantUse {
  @JsonKey(name: 'diseplant_id')
  final int diseplantId;

  @JsonKey(name: 'disease_id')
  final int diseaseId;

  @JsonKey(name: 'plant_id')
  final int? plantId;

  final String use;
  final String preparation;
  final String indication;

  @JsonKey(name: 'sync_status')
  final String? syncstatus;

  @JsonKey(name: 'last_updated')
  final int? lastupdated;

  DiseasePlantUseModel({
    required this.diseplantId,
    required this.diseaseId,
    required this.plantId,
    required this.use,
    required this.preparation,
    required this.indication,
    required this.syncstatus,
    required this.lastupdated,
  }) : super(
         diseplantId: diseplantId,
         diseaseId: diseaseId,
         plantId: plantId,
         use: use,
         preparation: preparation,
         indication: indication,
         syncstatus: syncstatus,
         lastupdated: lastupdated,
       );

  factory DiseasePlantUseModel.fromJson(Map<String, dynamic> json) =>
      _$DiseasePlantUseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiseasePlantUseModelToJson(this);

  factory DiseasePlantUseModel.fromMap(Map<String, dynamic> map) =>
      DiseasePlantUseModel(
        diseplantId: map["diseplant_id"],
        diseaseId: map["disease_id"],
        plantId: map["plant_id"],
        use: map['use'],
        preparation: map['preparation'],
        indication: map['indication'],
        syncstatus: map["sync_status"],
        lastupdated: map["last_updated"],
      );

  Map<String, dynamic> toMap() => toJson();
}
