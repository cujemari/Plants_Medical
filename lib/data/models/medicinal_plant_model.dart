class MedicinalPlantModel {
  final int plantId;
  final String nameplant;
  final String imageplant;
  final String vulgarsynomaly;
  final String cientificname;
  final String family;
  final String botanicaldescription;
  final String habitat;
  final String chemicalcomposition;
  final String syncStatus;
  final int lastUpdated;
  MedicinalPlantModel({
    required this.plantId,
    required this.nameplant,
    required this.imageplant,
    required this.vulgarsynomaly,
    required this.cientificname,
    required this.family,
    required this.botanicaldescription,
    required this.habitat,
    required this.chemicalcomposition,
    required this.syncStatus,
    required this.lastUpdated,
  });

  // Convertir JSON a objeto plant

  factory MedicinalPlantModel.fromJson(Map<String, dynamic> json) {
    return MedicinalPlantModel(
      plantId: json['plant_id'],
      nameplant: json['name_plant'],
      imageplant: json['image_plant'],
      vulgarsynomaly: json['vulgar_synomaly'],
      cientificname: json['scientific_name'],
      family: json['family'],
      botanicaldescription: json['botanical_description'],
      habitat: json['habitat'],
      chemicalcomposition: json['chemical_composition'],
      syncStatus: json['sync_status'] ?? 'pending',
      lastUpdated: json['last_updated'] is int
          ? json['last_updated']
          : DateTime.now().millisecondsSinceEpoch,
    );
  }
  // Convertir objeto plant a JSON

  Map<String, dynamic> toJson() {
    return {
      'plant_id': plantId,
      'name_plant': nameplant,
      'image_plant': imageplant,
      'vulgar_synomaly': vulgarsynomaly,
      'scientific_name': cientificname,
      'family': family,
      'botanical_description': botanicaldescription,
      'habitat': habitat,
      'chemical_composition': chemicalcomposition,
      'sync_status': syncStatus,
      'last_updated': lastUpdated,
    };
  }

  // Convierte un MedicinalPlant a un Map para la inserción en la base de datos
  Map<String, dynamic> toMap() {
    return {
      'plant_id': plantId,
      'name_plant': nameplant,
      'image_plant': imageplant,
      'vulgar_synomaly': vulgarsynomaly,
      'scientific_name': cientificname,
      'family': family,
      'botanical_description': botanicaldescription,
      'habitat': habitat,
      'chemical_composition': chemicalcomposition,
      'sync_status': syncStatus,
      'last_updated': lastUpdated,
    };
  }

  factory MedicinalPlantModel.fromMap(Map<String, dynamic> map) {
    return MedicinalPlantModel(
      plantId: map["plant_id"],
      nameplant: map["name_plant"],
      imageplant: map["image_plant"],
      vulgarsynomaly: map["vulgar_synomaly"],
      cientificname: map["scientific_name"],
      family: map["family"],
      botanicaldescription: map["botanical_description"],
      habitat: map["habitat"],
      chemicalcomposition: map["chemical_composition"],
      syncStatus: map["sync_status"],
      lastUpdated: map["last_updated"],
    );
  }
}
