class UserDiseaseModel {
  final int userdiseaseId;
  final int? userId;
  final int? diseaseId;
  final String? syncstatus;
  final int? lastupdated;

  UserDiseaseModel({
    required this.userdiseaseId,
    required this.userId,
    required this.diseaseId,
    required this.syncstatus,
    required this.lastupdated,
  });

  // Convertir JSON a objeto user_disease

  factory UserDiseaseModel.fromJson(Map<String, dynamic> json) {
    return UserDiseaseModel(
      userdiseaseId: json['userdisease_id'],
      userId: json['user_id'],
      diseaseId: json['disease_id'],
      syncstatus: json['sync_status'],
      lastupdated: json['last_updated'],
    );
  }
  // Convertir objeto user_disease a JSON

  Map<String, dynamic> toJson() {
    return {
      'userdisease_id': userdiseaseId,
      'user_id': userId,
      'disease_id': diseaseId,
      'sync_status': syncstatus,
      'last_updated': lastupdated,
    };
  }

  // Convierte un UserDesease a un Map para la inserción en la base de datos

  Map<String, dynamic> toMap() {
    return {
      "setting_id": userdiseaseId,
      "user_id": userId,
      "desease_id": diseaseId,
      "sync_status": syncstatus,
      "last_updated": lastupdated,
    };
  }

  factory UserDiseaseModel.fromMap(Map<String, dynamic> map) =>
      UserDiseaseModel(
        userdiseaseId: map["userdesease_id"],
        userId: map["user_id"],
        diseaseId: map["desease_id"],
        syncstatus: map["sync_status"],
        lastupdated: map["last_update"],
      );
}
