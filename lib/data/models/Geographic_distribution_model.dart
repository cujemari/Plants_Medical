class DistributionModel {
  final int distributionId;
  final int? plantId;
  final String imagenmap;
  final String descriptiondistribution;
  final String? syncstatus;
  final int? lastupdated;

  DistributionModel({
    required this.distributionId,
    required this.plantId,
    required this.imagenmap,
    required this.descriptiondistribution,
    required this.syncstatus,
    required this.lastupdated,
  });

  // Convertir JSON a objeto geographic_destribution

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
  // Convertir objeto geographic_destribution a JSON

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

  // Convierte un Geographic_Distribution a un Map para la inserción en la base de datos

  Map<String, dynamic> toMap() {
    return {
      "distribution_id": distributionId,
      "plant_id": plantId,
      "image_map": imagenmap,
      "description_distribution": descriptiondistribution,
      "sync_status": syncstatus,
      "last_updated": lastupdated,
    };
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
