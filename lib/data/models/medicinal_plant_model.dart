import 'package:app_plants/domain/entities/medicinal_plant.dart';

class MedicinalPlantModel extends MedicinalPlant {
  MedicinalPlantModel({
    required int plantId,
    required String nameplant,
    required String imageplant,
    required String vulgarsynomaly,
    required String cientificname,
    required String family,
    required String botanicaldescription,
    required String habitat,
    required String chemicalcomposition,
    required String syncStatus,
    required int lastUpdated,
  }) : super(
         plantId: plantId,
         nameplant: nameplant,
         imageplant: imageplant,
         vulgarsynomaly: vulgarsynomaly,
         cientificname: cientificname,
         family: family,
         botanicaldescription: botanicaldescription,
         habitat: habitat,
         chemicalcomposition: chemicalcomposition,
         syncStatus: syncStatus,
         lastUpdated: lastUpdated,
       );

  /// Convierte un JSON a una instancia de [MedicinalPlantModel]
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

  /// Convierte un [Map] de base de datos a una instancia de [MedicinalPlantModel]
  factory MedicinalPlantModel.fromMap(Map<String, dynamic> map) {
    return MedicinalPlantModel(
      plantId: map['plant_id'],
      nameplant: map['name_plant'],
      imageplant: map['image_plant'],
      vulgarsynomaly: map['vulgar_synomaly'],
      cientificname: map['scientific_name'],
      family: map['family'],
      botanicaldescription: map['botanical_description'],
      habitat: map['habitat'],
      chemicalcomposition: map['chemical_composition'],
      syncStatus: map['sync_status'],
      lastUpdated: map['last_updated'],
    );
  }

  /// Convierte el objeto a JSON para envío remoto o APIs
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

  /// Convierte el objeto a [Map] para base de datos local
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
}
