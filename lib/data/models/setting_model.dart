class SettingModel {
  final int settingId;
  final int? userId;
  final int darkmode;
  final String termsconditions;
  final String credits;
  final String syncstatus;
  final int lastupdated;

  SettingModel({
    required this.settingId,
    required this.userId,
    required this.darkmode,
    required this.termsconditions,
    required this.credits,
    required this.syncstatus,
    required this.lastupdated,
  });

  // Convertir JSON a objeto setting

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    return SettingModel(
      settingId: json['setting_id'],
      userId: json['user_id'],
      darkmode: json['dark_mode'],
      termsconditions: json['terms_conditions'],
      credits: json['credits'],
      syncstatus: json['sync_status'],
      lastupdated: json['last_updated'],
    );
  }
  // Convertir objeto setting a JSON

  Map<String, dynamic> toJson() {
    return {
      'setting_id': settingId,
      'user_id': userId,
      'dark_mode': darkmode,
      'terms_conditions': termsconditions,
      'credits': credits,
      'sync_status': syncstatus,
      'last_updated': lastupdated,
    };
  }

  // Convierte un setting a un Map para la inserción en la base de datos

  Map<String, dynamic> toMap() {
    return {
      "setting_id": settingId,
      "user_id": userId,
      "dark_mode": darkmode,
      "terms_conditions": termsconditions,
      "credits": credits,
      "sync_status": syncstatus,
      "last_updated": lastupdated,
    };
  }

  factory SettingModel.fromMap(Map<String, dynamic> map) {
    return SettingModel(
      settingId: map["setting_id"],
      userId: map["user_id"],
      darkmode: map["dark_mode"],
      termsconditions: map["terms_conditions"],
      credits: map["credits"],
      syncstatus: map["sync_status"],
      lastupdated: map["last_updated"],
    );
  }
}
