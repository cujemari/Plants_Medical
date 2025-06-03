class DiseaseViewHistoryModel {
  final int diseaseviewhistoryId;
  final int? userId;
  final int? diseaseId;
  final int? fechavista;
  final String? syncstatus;
  final int? lastupdated;
  DiseaseViewHistoryModel({
    required this.diseaseviewhistoryId,
    required this.userId,
    required this.diseaseId,
    required this.fechavista,
    required this.syncstatus,
    required this.lastupdated,
  });

  // Convertir JSON a objeto disease_view

  factory DiseaseViewHistoryModel.fromJson(Map<String, dynamic> json) {
    return DiseaseViewHistoryModel(
      diseaseviewhistoryId: json['diseaseviewhistory_id'],
      userId: json['user_id'],
      diseaseId: json['disease_id'],
      fechavista: json['fecha_vista'],
      syncstatus: json['sync_status'],
      lastupdated: json['last_updated'],
    );
  }
  // Convertir objeto disease_view a JSON

  Map<String, dynamic> toJson() {
    return {
      'diseaseviewhistory_id': diseaseviewhistoryId,
      'user_id': userId,
      'disease_id': diseaseId,
      'fecha_vista': fechavista,
      'sync_status': syncstatus,
      'last_updated': lastupdated,
    };
  }

  // Convierte un Disease_view_historial a un Map para la inserción en la base de datos

  Map<String, dynamic> toMap() {
    return {
      "diseaseviewhistory_id": diseaseviewhistoryId,
      "user_id": userId,
      "disease_id": diseaseId,
      "fecha_vista": fechavista,
      "sync_status": syncstatus,
      "last_updated": lastupdated,
    };
  }

  factory DiseaseViewHistoryModel.fromMap(Map<String, dynamic> map) {
    return DiseaseViewHistoryModel(
      diseaseviewhistoryId: map["diseaseviewhistory_id"],
      userId: map["user_id"],
      diseaseId: map["disease_id"],
      fechavista: map["fecha_vista"],
      syncstatus: map["ync_status"],
      lastupdated: map["last_updated"],
    );
  }
}
