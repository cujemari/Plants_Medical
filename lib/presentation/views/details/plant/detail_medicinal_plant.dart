import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/presentation/views/details/plant/plant_favorite_screen.dart';
import 'package:app_plants/presentation/wigets/plants_widgets/action_buttons.dart';
import 'package:app_plants/presentation/wigets/plants_widgets/infor_card.dart';
import 'package:app_plants/data/repositories/plant_repository_impl.dart';
import 'package:flutter/material.dart';

class DetailsMedicinalPlants extends StatefulWidget {
  final int plantaId;

  const DetailsMedicinalPlants({Key? key, required this.plantaId})
    : super(key: key);

  @override
  State<DetailsMedicinalPlants> createState() => _DetailsMedicinalPlantsState();
}

class _DetailsMedicinalPlantsState extends State<DetailsMedicinalPlants> {
  MedicinalPlantModel? _plant;
  bool _isLoading = true;

  static const _backgroundColor = Color(0xB30A2D14);

  final PlantRepositoryImpl _plantRepository = PlantRepositoryImpl();
  Future<void> _fetchPlant() async {
    print('Obteniendo planta con ID: ${widget.plantaId}');
    final plant = await _plantRepository.getPlantaById(widget.plantaId);
    print('Resultado: $plant');
    setState(() {
      _plant = plant;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState ejecutado - Cargando planta con ID: ${widget.plantaId}');
    _fetchPlant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: _backgroundColor,
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _plant == null
          ? const Center(child: Text('No se encontró la planta.'))
          : _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return OrientationBuilder(
      builder: (context, orientation) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return InteractiveViewer(
              panEnabled: true,
              minScale: 1,
              maxScale: 3,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: orientation == Orientation.landscape
                        ? _buildLandscapeContent()
                        : _buildPortraitContent(),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLandscapeContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: Column()),
        const SizedBox(width: 15),
        Expanded(flex: 2, child: _buildPlantDetails()),
      ],
    );
  }

  Widget _buildPortraitContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            _plant?.nameplant ?? '',
            style: const TextStyle(
              color: Color(0xFFF5EF49),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgia',
            ),
          ),
        ),

        const SizedBox(height: 5),
        PlantFavoriteScreen(plant: _plant),
        const SizedBox(height: 5),
        _buildPlantDetails(),
      ],
    );
  }

  Widget _buildPlantDetails() {
    if (_plant == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoCard(title: "Sinonimia vulgar:", content: _plant!.vulgarsynomaly),
        InfoCard(
          title: "Nombre científico:",
          content: _plant!.cientificname,
          isItalic: true,
        ),
        InfoCard(title: "Familia:", content: _plant!.family),
        InfoCard(
          title: "Descripción:",
          content: _plant!.botanicaldescription,
          isJustified: true,
        ),
        InfoCard(
          title: "Hábitat:",
          content: _plant!.habitat,
          isJustified: true,
        ),
        InfoCard(
          title: "Composición Química:",
          content: _plant!.chemicalcomposition,
          isJustified: true,
        ),
        const SizedBox(height: 45),
        ActionButtons(plantaId: _plant!.plantId),
      ],
    );
  }
}
