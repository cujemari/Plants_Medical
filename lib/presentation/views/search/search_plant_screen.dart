import 'package:app_plants/presentation/wigets/search_widgets/SearchHistoryManager.dart';
import 'package:flutter/material.dart';
import 'package:app_plants/presentation/viewmodels/search_plant_view_model.dart';
import 'package:app_plants/presentation/wigets/search_widgets/plant_grid_item.dart';
import 'package:app_plants/presentation/views/details/plant/detail_medicinal_plant.dart';

class SearchPlantScreen extends StatefulWidget {
  const SearchPlantScreen({super.key});

  @override
  State<SearchPlantScreen> createState() => _SearchPlantScreenState();
}

class _SearchPlantScreenState extends State<SearchPlantScreen> {
  final SearchPlantViewModel viewModel = SearchPlantViewModel();
  final SearchHistoryManager _historyManager = SearchHistoryManager();

  @override
  void initState() {
    super.initState();
    viewModel.loadPlantas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: viewModel,
          builder: (context, _) {
            return Column(
              children: [
                const SizedBox(height: 12),

                // Barra de búsqueda
                SearchBar(
                  controller: viewModel.controller,
                  onChanged: (text) {
                    viewModel.filtrarPlantas(text); // lógica de filtrado
                    _historyManager.addSearchTerm(text); // guardar historial
                  },
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  hintText:
                      "Buscar por nombre, científico, familia, descripción u otros",
                  hintStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.white),
                  ),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.black),
                  ),
                  leading: const Icon(Icons.search, color: Colors.white),
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
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 0.75,
                                ),
                            itemBuilder: (context, index) {
                              final planta = viewModel.plantasFiltradas[index];
                              return PlantGridItem(
                                planta: planta,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DetailsMedicinalPlants(
                                        plantaId: planta.plantId,
                                      ),
                                    ),
                                  );
                                },
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
