class PreparationUseModel {
  final int preparationuseId;
  final int? plantId;
  final String use;
  final String preparation;
  final String indication;
  final String? syncstatus;
  final int? lastupdated;

  PreparationUseModel({
    required this.preparationuseId,
    required this.plantId,
    required this.use,
    required this.preparation,
    required this.indication,
    required this.syncstatus,
    required this.lastupdated,
  });

  // Convertir JSON a objeto preparation_use

  factory PreparationUseModel.fromJson(Map<String, dynamic> json) {
    return PreparationUseModel(
      preparationuseId: json['preparationuse_id'],
      plantId: json['plant_id'],
      use: json['use'],
      preparation: json['preparation'],
      indication: json['indication'],
      syncstatus: json['sync_status'] ?? 'pending',
      lastupdated: json['last_updated'] is int
          ? json['last_updated']
          : DateTime.now().millisecondsSinceEpoch,
    );
  }
  // Convertir objeto preparation_use a JSON

  Map<String, dynamic> toJson() {
    return {
      'preparationuse_id': preparationuseId,
      'plant_id': plantId,
      'use': use,
      'preparation': preparation,
      'indication': indication,
      'sync_status': syncstatus,
      'last_updated': lastupdated,
    };
  }

  // Convierte un preparation_use a un Map para la inserción en la base de datos

  Map<String, dynamic> toMap() {
    return {
      "preparationuse_id": preparationuseId,
      "plant_id": plantId,
      "use": use,
      "preparation": preparation,
      "indication": indication,
      "sync_status": syncstatus,
      "last_updated": lastupdated,
    };
  }

  factory PreparationUseModel.fromMap(Map<String, dynamic> map) {
    return PreparationUseModel(
      preparationuseId: map["preparationuse_id"],
      plantId: map["plant_id"],
      use: map['use'],
      preparation: map['preparation'],
      indication: map['indication'],
      syncstatus: map["sync_status"],
      lastupdated: map["last_updated"],
    );
  }
}
