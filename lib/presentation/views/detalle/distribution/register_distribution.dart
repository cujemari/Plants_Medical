import 'package:app_plants/data/models/Geographic_distribution_model.dart';
import 'package:app_plants/data/repositories/geographicdistribution_repository_impl.dart';

Future<void> registrarDistribution() async {
  final nuevaDistribution = DistributionModel(
    distributionId: 001,
    plantId: null,
    imagenmap: 'assets/logos/map.png',
    descriptiondistribution:
        'Normalmente se distribuye por los departamentos de: Amazonas, Cusco, Huánuco, Loreto, Madre de Dios, Pasco, San Martín, Ucayali.',
    syncstatus: 'pendiente',
    lastupdated: DateTime.now().millisecondsSinceEpoch,
  );

  final dbService = GeographicDistributionRepositoryImpl();

  try {
    await dbService.insertarDistribucion(nuevaDistribution);
    print('Distribución registrada con éxito.');
  } catch (e) {
    print('Error al registrar distribución: $e');
  }
}
