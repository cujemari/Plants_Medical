class UserModel {
  final int? userId; // nullable porque se genera automáticamente
  final int? firebaseuId;
  final String photo;
  final String fullname;
  final String email;
  final String? titleuser;
  final String? description;
  final bool isOffline;
  final String syncStatus;
  final int lastUpdated;

  UserModel({
    required this.userId,
    required this.firebaseuId,
    required this.photo,
    required this.fullname,
    required this.email,
    required this.titleuser,
    required this.description,
    required this.isOffline,
    required this.syncStatus,
    required this.lastUpdated,
  });

  //Método copyWith corregido
  UserModel copyWith({
    int? userId,
    int? firebaseuId,
    String? photo,
    String? fullname,
    String? email,
    String? titleuser,
    String? description,
    bool? isOffline,
    String? syncStatus,
    int? lastUpdated,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      firebaseuId: firebaseuId ?? this.firebaseuId,
      photo: photo ?? this.photo,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      titleuser: titleuser ?? this.titleuser,
      description: description ?? this.description,
      isOffline: isOffline ?? this.isOffline,
      syncStatus: syncStatus ?? this.syncStatus,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  //Convertir JSON a objeto User
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      firebaseuId: json['firebase_uid'],
      photo: json['photo'],
      fullname: json['full_name'],
      email: json['email'],
      titleuser: json['title_user'],
      description: json['description_user'],
      isOffline: json['is_offline'] == 1,
      syncStatus: json['sync_status'],
      lastUpdated: json['last_updated'],
    );
  }

  //Convertir objeto User a JSON
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'firebase_uid': firebaseuId,
      'photo': photo,
      'full_name': fullname,
      'email': email,
      'title_user': titleuser,
      'description_user': description,
      'is_offline': isOffline ? 1 : 0,
      'sync_status': syncStatus,
      'last_updated': lastUpdated,
    };
  }

  //Convertir objeto User a Map (para base de datos)
  Map<String, dynamic> toMap() {
    return {
      if (userId != null) 'user_id': userId,
      'firebase_uid': firebaseuId,
      'photo': photo,
      'full_name': fullname,
      'email': email,
      'title_user': titleuser,
      'description': description,
      'is_offline': isOffline ? 1 : 0,
      'sync_status': syncStatus,
      'last_updated': lastUpdated,
    };
  }

  //Crear User desde un Map (desde base de datos)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['user_id'],
      firebaseuId: map['firebase_uid'],
      photo: map['photo'],
      fullname: map['full_name'],
      email: map['email'],
      titleuser: map['title_user'],
      description: map['description'],
      isOffline: map['is_offline'] == 1,
      syncStatus: map['sync_status'],
      lastUpdated: map['last_updated'],
    );
  }
}
