import 'package:app_plants/domain/entities/Distribution.dart';

class DistributionModel extends Distribution {
  DistributionModel({
    required int distributionId,
    int? plantId,
    required String imagenmap,
    required String descriptiondistribution,
    String? syncstatus,
    int? lastupdated,
  }) : super(
         distributionId: distributionId,
         plantId: plantId,
         imagenmap: imagenmap,
         descriptiondistribution: descriptiondistribution,
         syncstatus: syncstatus,
         lastupdated: lastupdated,
       );

  factory DistributionModel.fromJson(Map<String, dynamic> json) {
    return DistributionModel(
      distributionId: json['distribution_id'],
      plantId: json['plant_id'],
      imagenmap: json['image_map'],
      descriptiondistribution: json['description_distribution'],
      syncstatus: json['sync_status'] ?? 'pending',
      lastupdated: json['last_updated'] is int
          ? json['last_updated']
          : DateTime.now().millisecondsSinceEpoch,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'distribution_id': distributionId,
      'plant_id': plantId,
      'image_map': imagenmap,
      'description_distribution': descriptiondistribution,
      'sync_status': syncstatus,
      'last_updated': lastupdated,
    };
  }

  Map<String, dynamic> toMap() {
    return toJson(); // Puedes usar toJson directamente como Map
  }

  factory DistributionModel.fromMap(Map<String, dynamic> map) {
    return DistributionModel(
      distributionId: map["distribution_id"],
      plantId: map["plant_id"],
      imagenmap: map["image_map"],
      descriptiondistribution: map["description_distribution"],
      syncstatus: map["sync_status"],
      lastupdated: map["last_updated"],
    );
  }
}
