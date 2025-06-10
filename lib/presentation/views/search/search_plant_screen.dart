import 'package:app_plants/presentation/viewmodels/search_plant_view_model.dart';
import 'package:app_plants/presentation/wigets/search_widgets/plant_grid_item.dart';
import 'package:flutter/material.dart';

import '../details/plant/detail_medicinal_plant.dart';

class SearchPlantScreen extends StatefulWidget {
  const SearchPlantScreen({Key? key}) : super(key: key);

  @override
  State<SearchPlantScreen> createState() => _SearchPlantScreenState();
}

class _SearchPlantScreenState extends State<SearchPlantScreen> {
  final viewModel = SearchPlantViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadPlantas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: viewModel,
          builder: (context, _) {
            return Column(
              children: [
                const SizedBox(height: 12),
                SearchBar(
                  controller: viewModel.controller,
                  onChanged: viewModel.filtrarPlantas,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: viewModel.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : viewModel.plantasFiltradas.isEmpty
                      ? const Center(
                          child: Text(
                            'No se encontraron resultados.',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GridView.builder(
                            itemCount: viewModel.plantasFiltradas.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 0.75,
                                ),
                            itemBuilder: (context, index) {
                              final planta = viewModel.plantasFiltradas[index];
                              return PlantGridItem(
                                planta: planta,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailsMedicinalPlants(
                                      plantaId: planta.plantId,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
