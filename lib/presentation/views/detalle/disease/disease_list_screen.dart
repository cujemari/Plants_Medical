import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/datasources/local/tables/disease_table.dart';
import 'package:app_plants/data/models/disease_model.dart';
import 'package:app_plants/presentation/views/detalle/disease/detail_disease.dart'; // Asegúrate de tener esto
import 'package:flutter/material.dart';

class DiseaseListScreen extends StatefulWidget {
  const DiseaseListScreen({Key? key}) : super(key: key);

  @override
  State<DiseaseListScreen> createState() => _DiseaseListScreenState();
}

class _DiseaseListScreenState extends State<DiseaseListScreen> {
  final TextEditingController _controller = TextEditingController();
  List<DiseaseModel> _enfermedades = [];
  List<DiseaseModel> _enfermedadesFiltradas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEnfermedades();
  }

  Future<void> _loadEnfermedades() async {
    final db = await LocalDatabase().database;
    final data = await db.query(DiseaseTable.tablename);

    setState(() {
      _enfermedades = data.map((e) => DiseaseModel.fromMap(e)).toList();
      _enfermedadesFiltradas = _enfermedades;
      _isLoading = false;
    });
  }

  void _filtrarEnfermedades(String query) {
    setState(() {
      final d = query.toLowerCase();
      _enfermedadesFiltradas = _enfermedades.where((enfermedad) {
        return enfermedad.namedisease.toLowerCase().contains(d) ||
            enfermedad.descriptiondisease.toLowerCase().contains(d) ||
            enfermedad.symptoms.toLowerCase().contains(d);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0B918A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B918A),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Enfermedades comunes",
          style: TextStyle(fontFamily: "Arial", fontSize: 18),
        ),
      ),
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
                    hintText: "Buscar nombre, descripción o sintomas",
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: _filtrarEnfermedades,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _enfermedadesFiltradas.isEmpty
                  ? const Center(
                      child: Text(
                        'No se encontraron enfermedades.',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                        itemCount: _enfermedadesFiltradas.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.75,
                            ),
                        itemBuilder: (context, index) {
                          final enfermedad = _enfermedadesFiltradas[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailDisease(
                                    diseaseId: enfermedad.diseaseId,
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
                                    height: 140,
                                    width: double.infinity,
                                    child: Image.asset(
                                      enfermedad.imagedisease,
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
                                    color: const Color.fromARGB(255, 3, 50, 27),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      enfermedad.namedisease,
                                      style: const TextStyle(
                                        fontSize: 13,
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
