import 'package:app_plants/data/models/disease_model.dart';
import 'package:app_plants/data/repositories/disease_repository_impl.dart';

Future<void> registrarDisease() async {
  final nuevaDisease = DiseaseModel(
    diseaseId:
        001, // Los identificadores manuales pueden causar conflictos si ya existen
    namedisease: 'Anemia',
    imagedisease: 'assets/disease/anemia.png',
    descriptiondisease:
        'Según Ministerio de Salud: La anemia es una enfermedad que se origina cuando hay una cantidad insuficiente de hierro en la sangre.',
    symptoms:
        "los signos y síntomas de la anemia se intensifican y pueden provocar:"
        "- Cansancio y palidez"
        "- Incremento del sueño"
        "- Irritabilidad"
        "- Mareos"
        "- Pérdida de apetito",

    syncstatus: 'pendiente',
    lastupdated: DateTime.now().millisecondsSinceEpoch,
  );

  final dbService = DiseaseRepositoryImpl();
  await dbService.insertarEnfermedad(
    nuevaDisease,
  ); // Este método debe estar definido en LocalDatabaseService
}
