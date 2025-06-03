import 'package:app_plants/data/models/preparation_use_model.dart';
import 'package:app_plants/data/repositories/preparationuse_repository_impl.dart';

Future<void> registrarusepreparation() async {
  final nuevaUsePreparation = PreparationUseModel(
    preparationuseId:
        001, // Los identificadores manuales pueden causar conflictos si ya existen
    plantId: null,
    use: "Raíz: Tres raices de la abuta blanca",
    preparation:
        "Con un pequeño maso machacar la raiz, agregarlo en un recipiente con una tasa de agua, ponerlo a hervir por 5 minutos.",
    indication:
        "Tomar el cocimiento de la raíz, dos veces al dia, por una semana.",
    syncstatus: "pendiente",
    lastupdated: DateTime.now().millisecondsSinceEpoch,
  );

  final dbService = PreparationuseRepositoryImpl();
  await dbService.insertarPreparationUse(
    nuevaUsePreparation,
  ); // Este método debe estar definido en LocalDatabaseService
}
