import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlantRemoteDataSource {
  final FirebaseFirestore firestore;

  PlantRemoteDataSource({FirebaseFirestore? firestore})
    : firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<MedicinalPlantModel>> getPlantasMedicinales() async {
    try {
      final snapshot = await firestore.collection('plantas medicinales').get();
      return snapshot.docs
          .map((doc) => MedicinalPlantModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error al obtener plantas de Firestore: $e');
      rethrow;
    }
  }
}
