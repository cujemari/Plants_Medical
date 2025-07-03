import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/plant_table.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/presentation/views/details/plant/detail_medicinal_plant.dart';
import 'package:app_plants/presentation/views/details/disease/disease_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<MedicinalPlantModel> _plantas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPlantas();
  }

  Future<void> _loadPlantas() async {
    final db = await LocalDatabase().database;
    final data = await db.query(PlantTable.tableName);
    setState(() {
      _plantas = data.map((e) => MedicinalPlantModel.fromMap(e)).toList();
      _isLoading = false;
    });
  }

  List<int> _visibleIndicators() {
    int total = _plantas.length;
    int maxVisible = 5;

    if (total <= maxVisible) return List.generate(total, (i) => i);

    int start = _currentIndex - (maxVisible ~/ 2);
    if (start < 0) start = 0;
    if (start + maxVisible > total) start = total - maxVisible;

    return List.generate(maxVisible, (i) => start + i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  const SizedBox(height: 23),

                  /// Carrusel de plantas medicinales
                  CarouselSlider(
                    options: CarouselOptions(
                      height:
                          MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? MediaQuery.of(context).size.height * 0.96
                          : MediaQuery.of(context).size.height * 0.5,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 1.0, // Ocupa todo el ancho
                      onPageChanged: (index, _) {
                        setState(() => _currentIndex = index);
                      },
                    ),
                    items: _plantas.map((planta) {
                      return GestureDetector(
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                planta.imageplant,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  color: Colors.grey[300],
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.broken_image,
                                    size: 60,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black54,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    planta.nameplant,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          offset: Offset(0, 1),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 14),

                  /// 🔵 Indicadores del carrusel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _visibleIndicators().map((index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        height: 10,
                        width: _currentIndex == index ? 14 : 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.green
                              : Colors.grey[300],
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 50),

                  /// 🩺 Botón de Enfermedades Comunes
                  SizedBox(
                    width: 250,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DiseaseListScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.healing, size: 22),
                      label: const Text(
                        'Enfermedades Comunes',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
