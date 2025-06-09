import 'package:app_plants/presentation/views/detalle/plant/detail_medicinal_plant.dart';
import 'package:flutter/material.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/favoriteplant_repository_impl.dart';

class FavoritesPlantScreen extends StatefulWidget {
  const FavoritesPlantScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesPlantScreen> createState() => _FavoritesPlantScreenState();
}

class _FavoritesPlantScreenState extends State<FavoritesPlantScreen> {
  final FavoriteplantRepositoryImpl _favoriteRepo =
      FavoriteplantRepositoryImpl();
  List<MedicinalPlantModel> _favoritePlants = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavoritePlants();
  }

  Future<void> _loadFavoritePlants() async {
    final favoriteIds = await _favoriteRepo.getFavorites();
    List<MedicinalPlantModel> plants = [];

    for (var id in favoriteIds) {
      final plant = await _favoriteRepo.getPlantById(id);
      if (plant != null) {
        plants.add(plant);
      }
    }

    setState(() {
      _favoritePlants = plants;
      _isLoading = false;
    });
  }

  Future<void> _removeFavorite(int plantId) async {
    await _favoriteRepo.removeFavorite(plantId);
    await _loadFavoritePlants(); // Recarga la lista después de remover
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0B918A),
      appBar: AppBar(
        title: const Text('Mis plantas Favoritas'),
        backgroundColor: const Color(0xFF0B918A),
        centerTitle: true,
      ),
      body: _favoritePlants.isEmpty
          ? const Center(
              child: Text(
                'No hay plantas favoritas aún.',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: _favoritePlants.length,
              itemBuilder: (context, index) {
                final planta = _favoritePlants[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsMedicinalPlants(plantaId: planta.plantId),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 17,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: width * 0.30,
                            right: 16,
                            top: 25,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 3, 50, 27),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      planta.nameplant,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      planta.cientificname,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      planta.family,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.green,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      _removeFavorite(planta.plantId);
                                    },
                                  ),
                                  // Puedes agregar un botón de eliminar si tienes funcionalidad separada
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -10,
                          left: -10,
                          child: Container(
                            width: width * 0.28,
                            height: width * 0.28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 12,
                                  offset: const Offset(3, 5),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                  planta.imageplant,
                                ), // imagen local
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

/**  Para integrar correctamente:
Conectar con SQLite en modo offline.

Sincronizar con Firebase en modo online (usando cloud_firestore).

Lógica separada en un ViewModel o controller (FavoritosViewModel).*/
