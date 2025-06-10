import 'package:app_plants/presentation/viewmodels/favorites_view_model.dart';
import 'package:app_plants/presentation/wigets/plants_widgets/plant_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_plants/presentation/views/details/plant/detail_medicinal_plant.dart';

class FavoritesPlantScreen extends StatelessWidget {
  const FavoritesPlantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoritesViewModel>();

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Mis plantas favoritas'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.favorites.isEmpty
          ? const Center(
              child: Text(
                'No hay plantas favoritas aún.',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: viewModel.favorites.length,
              itemBuilder: (context, index) {
                final plant = viewModel.favorites[index];
                return PlantCard(
                  plant: plant,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DetailsMedicinalPlants(plantaId: plant.plantId),
                      ),
                    );
                  },
                  onRemove: () {
                    viewModel.removeFavorite(plant.plantId);
                  },
                );
              },
            ),
    );
  }
}
