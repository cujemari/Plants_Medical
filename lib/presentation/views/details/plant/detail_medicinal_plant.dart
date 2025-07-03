import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/presentation/wigets/favorite_widgets/plant_favorite.dart';
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

  @override
  void initState() {
    super.initState();
    _fetchPlant();
  }

  Future<void> _fetchPlant() async {
    final plant = await _plantRepository.getPlantaById(widget.plantaId);
    setState(() {
      _plant = plant;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
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
                padding: const EdgeInsets.all(15),
                child: _buildPortraitContent(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPortraitContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPlantTitle(),
        const SizedBox(height: 10),
        _buildActionButtons(),
        const SizedBox(height: 10),
        _buildPlantDetails(),
      ],
    );
  }

  Widget _buildPlantTitle() {
    return Center(
      child: Text(
        _plant?.nameplant ?? '',
        style: const TextStyle(
          color: Color(0xFFF5EF49),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'Georgia',
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Align(
      alignment: Alignment.centerRight,
      child: PlantFavorite(plant: _plant),
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
          title: "Descripción Bótanica:",
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
