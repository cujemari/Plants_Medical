import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/plant_table.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/presentation/views/detalle/disease/disease_list_screen.dart';
import 'package:app_plants/presentation/views/detalle/plant/detail_medicinal_plant.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<int> _visibleIndicators() {
    int total = _plantas.length;
    int maxVisible = 5;

    if (total <= maxVisible) {
      return List.generate(total, (i) => i);
    }

    int start = _currentIndex - (maxVisible ~/ 1);
    if (start < 0) start = 0;
    if (start + maxVisible > total) start = total - maxVisible;

    return List.generate(maxVisible, (i) => start + i);
  }

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

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0B918A),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    // Carrusel de imágenes
                    CarouselSlider(
                      options: CarouselOptions(
                        height: screenHeight * 0.4,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayInterval: const Duration(seconds: 3),
                        viewportFraction: 0.99,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: _plantas.map((planta) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsMedicinalPlants(
                                          plantaId: planta.plantId,
                                        ),
                                  ),
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        planta.imageplant,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black54,
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        planta.nameplant,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    // Indicadores
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _visibleIndicators().map((index) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.deepPurpleAccent
                                : Colors.grey[300],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),

                    // Botón "Enfermedades Comunes"
                    SizedBox(
                      width: 220,
                      height: 45,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DiseaseListScreen(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.medical_services,
                          color: Colors.red,
                          size: 21,
                        ),
                        label: const Text(
                          'Enfermedades Comunes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
