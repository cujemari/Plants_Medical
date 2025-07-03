import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_plants/presentation/viewmodels/favorites_view_model.dart';
import 'package:app_plants/presentation/views/details/plant/detail_medicinal_plant.dart';
import 'package:app_plants/presentation/wigets/favorite_widgets/plant_card.dart';

class FavoritesPlantScreen extends StatefulWidget {
  const FavoritesPlantScreen({super.key});

  @override
  State<FavoritesPlantScreen> createState() => _FavoritesPlantScreenState();
}

class _FavoritesPlantScreenState extends State<FavoritesPlantScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<FavoritesViewModel>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: viewModel.favorites.isEmpty
              ? const Center(
                  child: Text(
                    'No hay plantas favoritas aún.',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: viewModel.loadFavorites,
                  child: ListView.builder(
                    itemCount: viewModel.favorites.length,
                    itemBuilder: (context, index) {
                      final plant = viewModel.favorites[index];
                      return PlantCard(
                        plant: plant,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsMedicinalPlants(
                                plantaId: plant.plantId,
                              ),
                            ),
                          );
                          viewModel.loadFavorites(); // refrescar al volver
                        },
                        onRemove: () {
                          viewModel.removeFavorite(plant.plantId);
                        },
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
