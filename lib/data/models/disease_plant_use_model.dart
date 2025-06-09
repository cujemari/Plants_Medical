class DiseasePlantUseModel {
  final int diseplantId;
  final int diseaseId;
  final int? plantId;
  final String use;
  final String preparation;
  final String indication;
  final String? syncstatus;
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
  });

  // Convertir JSON a objeto preparation_use

  factory DiseasePlantUseModel.fromJson(Map<String, dynamic> json) {
    return DiseasePlantUseModel(
      diseplantId: json['diseplant_id'],
      diseaseId: json['disease_id'],
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
      'diseplant_id': diseplantId,
      'disease_id': diseaseId,
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
      "diseplant_id": diseplantId,
      "disease_id": diseaseId,
      "plant_id": plantId,
      "use": use,
      "preparation": preparation,
      "indication": indication,
      "sync_status": syncstatus,
      "last_updated": lastupdated,
    };
  }

  factory DiseasePlantUseModel.fromMap(Map<String, dynamic> map) {
    return DiseasePlantUseModel(
      diseplantId: map["diseplant_id"],
      diseaseId: map["disease_id"],
      plantId: map["plant_id"],
      use: map['use'],
      preparation: map['preparation'],
      indication: map['indication'],
      syncstatus: map["sync_status"],
      lastupdated: map["last_updated"],
    );
  }
}
