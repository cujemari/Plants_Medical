import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/plant_table.dart';
import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/presentation/views/detalle/plant/detail_medicinal_plant.dart';
import 'package:flutter/material.dart';

class SearchPlantScreen extends StatefulWidget {
  const SearchPlantScreen({Key? key}) : super(key: key);

  @override
  State<SearchPlantScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchPlantScreen> {
  final TextEditingController _controller = TextEditingController();

  List<MedicinalPlantModel> _plantas = [];
  List<MedicinalPlantModel> _plantasFiltradas = [];
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
      _plantasFiltradas = _plantas; // Al inicio mostrar todas
      _isLoading = false;
    });
  }

  void _filtrarPlantas(String query) {
    setState(() {
      _plantasFiltradas = _plantas
          .where(
            (planta) =>
                planta.nameplant.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0B918A),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: screenWidth * 0.9,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Buscar por nombre de la planta",
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: _filtrarPlantas,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _plantasFiltradas.isEmpty
                  ? const Center(
                      child: Text(
                        'No se encontraron resultados.',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                        itemCount: _plantasFiltradas.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.75,
                            ),
                        itemBuilder: (context, index) {
                          final planta = _plantasFiltradas[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsMedicinalPlants(
                                    plantaId: planta.plantId,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                    height: 120,
                                    width: double.infinity,
                                    child: Image.asset(
                                      planta.imageplant,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 9,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.teal[800],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      planta.nameplant,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/**

🛠️ Para la integración completa:
Conectar el listado con SQLite o Retrofit (modo online/offline).

Implementar un ViewModel (ej: BuscarViewModel) que separe la lógica de filtrado.

Hacer pruebas con plantas reales desde base de datos.*/
