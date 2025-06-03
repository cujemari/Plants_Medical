class DiseaseModel {
  final int diseaseId;
  final String namedisease;
  final String imagedisease;
  final String descriptiondisease;
  final String symptoms;
  final String syncstatus;
  final int lastupdated;

  DiseaseModel({
    required this.diseaseId,
    required this.namedisease,
    required this.imagedisease,
    required this.descriptiondisease,
    required this.symptoms,
    required this.syncstatus,
    required this.lastupdated,
  });

  // Convertir JSON a objeto disease

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      diseaseId: json['disease_id'],
      namedisease: json['name_disease'],
      imagedisease: json['image_disease'],
      descriptiondisease: json['description_disease'],
      symptoms: json['symptoms'],
      syncstatus: json['sync_status'] ?? 'pending',
      lastupdated: json['last_updated'] is int
          ? json['last_updated']
          : DateTime.now().millisecondsSinceEpoch,
    );
  }
  // Convertir objeto disease a JSON

  Map<String, dynamic> toJson() {
    return {
      'disease_id': diseaseId,
      'name_disease': namedisease,
      'image_disease': imagedisease,
      'description_disease': descriptiondisease,
      'symptoms': symptoms,
      'sync_status': syncstatus,
      'last_updated': lastupdated,
    };
  }

  // Convierte un Disease a un Map para la inserción en la base de datos
  Map<String, dynamic> toMap() {
    return {
      "disease_id": diseaseId,
      "name_disease": namedisease,
      "image_disease": imagedisease,
      "description_disease": descriptiondisease,
      "symptoms": symptoms,
      "sync_status": syncstatus,
      "last_updated": lastupdated,
    };
  }

  factory DiseaseModel.fromMap(Map<String, dynamic> map) {
    return DiseaseModel(
      diseaseId: map["disease_id"],
      namedisease: map["name_disease"],
      imagedisease: map["image_disease"],
      descriptiondisease: map["description_disease"],
      symptoms: map["symptoms"],
      syncstatus: map["sync_status"],
      lastupdated: map["last_updated"],
    );
  }
}
