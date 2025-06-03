class PlantViewHistoryModel {
  final int plantviewhistoryId;
  final int? userId;
  final int? plantId;
  final int? fechavista;
  final String? syncstatus;
  final int? lastupdated;

  PlantViewHistoryModel({
    required this.plantviewhistoryId,
    required this.userId,
    required this.plantId,
    required this.fechavista,
    required this.syncstatus,
    required this.lastupdated,
  });

  // Convertir JSON a objeto plant_view

  factory PlantViewHistoryModel.fromJson(Map<String, dynamic> json) {
    return PlantViewHistoryModel(
      plantviewhistoryId: json['plantviewhistory_id'],
      userId: json['user_id'],
      plantId: json['plant_id'],
      fechavista: json['fecha_vista'],
      syncstatus: json['sync_status'],
      lastupdated: json['last_updated'],
    );
  }
  // Convertir objeto plant_view a JSON

  Map<String, dynamic> toJson() {
    return {
      'plantviewhistory_id': plantviewhistoryId,
      'user_id': userId,
      'plant_id': plantId,
      'fecha_vista': fechavista,
      'sync_status': syncstatus,
      'last_updated': lastupdated,
    };
  }

  // Convierte un plant_view_historial a un Map para la inserción en la base de datos

  Map<String, dynamic> toMap() {
    return {
      "plantviewhistory_id": plantviewhistoryId,
      "user_id": userId,
      "plant_id": plantId,
      "fecha_vista": fechavista,
      "sync_status": syncstatus,
      "last_updated": lastupdated,
    };
  }

  factory PlantViewHistoryModel.fromMap(Map<String, dynamic> map) {
    return PlantViewHistoryModel(
      plantviewhistoryId: map["plantviewhistory_id"],
      userId: map["user_id"],
      plantId: map["plant_id"],
      fechavista: map["fecha_vista"],
      syncstatus: map["sync_status"],
      lastupdated: map["last_update"],
    );
  }
}
