class FavoritePlantModel {
  final int favoriteplantId;
  final int? userId;
  final int? plantId;
  final String titlefavorite;
  final bool isfavorite;
  final String? syncstatus;
  final int? lastupdated;

  FavoritePlantModel({
    required this.favoriteplantId,
    required this.userId,
    required this.plantId,
    required this.titlefavorite,
    required this.isfavorite,
    required this.syncstatus,
    required this.lastupdated,
  });

  // Convertir JSON a objeto favorite

  factory FavoritePlantModel.fromJson(Map<String, dynamic> json) {
    return FavoritePlantModel(
      favoriteplantId: json['favoriteplant_id'],
      userId: json['user_id'],
      plantId: json['plant_id'],
      titlefavorite: json['title_favorite'],
      isfavorite: json['is_favorite'],
      syncstatus: json['sync_status'],
      lastupdated: json['last_updated'],
    );
  }
  // Convertir objeto favorite a JSON

  Map<String, dynamic> toJson() {
    return {
      'favoriteplant_id': favoriteplantId,
      'user_id': userId,
      'plant_id': plantId,
      'title_favorite': titlefavorite,
      'is_favorite': isfavorite,
      'sync_status': syncstatus,
      'last_updated': lastupdated,
    };
  }

  // Convierte un favorites a un Map para la inserción en la base de datos

  Map<String, dynamic> toMap() {
    return {
      "diseaseviewhistory_id": favoriteplantId,
      "user_id": userId,
      "plant_id": plantId,
      "title_favorite": titlefavorite,
      "is_favorite": isfavorite,
      "sync_status": syncstatus,
      "last_updated": lastupdated,
    };
  }

  factory FavoritePlantModel.fromMap(Map<String, dynamic> map) {
    return FavoritePlantModel(
      favoriteplantId: map["favoriteplant_id"],
      userId: map["user_id"],
      plantId: map["plant_id"],
      titlefavorite: map["title_favorite"],
      isfavorite: map["is_favorit"],
      syncstatus: map["sync_status"],
      lastupdated: map["last_updated"],
    );
  }
}
