import 'package:app_plants/data/datasources/local/local_database.dart';
import 'package:app_plants/data/models/disease_model.dart';
import 'package:app_plants/presentation/views/details/disease/detail_disease.dart';
import 'package:flutter/material.dart';

class DiseaseListScreen extends StatefulWidget {
  const DiseaseListScreen({super.key});

  @override
  State<DiseaseListScreen> createState() => _DiseaseListScreenState();
}

class _DiseaseListScreenState extends State<DiseaseListScreen> {
  final TextEditingController _controller = TextEditingController();
  List<DiseaseModel> _enfermedades = [];
  List<DiseaseModel> _filtradas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEnfermedades();
  }

  Future<void> _loadEnfermedades() async {
    final db = await LocalDatabase().database;
    final data = await db.query('disease');
    final enfermedades = data.map((e) => DiseaseModel.fromJson(e)).toList();

    setState(() {
      _enfermedades = enfermedades;
      _filtradas = enfermedades;
      _isLoading = false;
    });
  }

  void _filtrar(String query) {
    final texto = query.toLowerCase();
    setState(() {
      _filtradas = _enfermedades.where((e) {
        return e.namedisease.toLowerCase().contains(texto) ||
            e.descriptiondisease.toLowerCase().contains(texto) ||
            e.symptoms.toLowerCase().contains(texto);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Enfermedades comunes",
          style: TextStyle(
            fontFamily: "Arial",
            fontSize: 18,
            color: theme.appBarTheme.foregroundColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextField(
                    controller: _controller,
                    onChanged: _filtrar,
                    decoration: const InputDecoration(
                      hintText: "Buscar nombre, descripción o síntomas",
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _filtradas.isEmpty
                  ? const Center(
                      child: Text(
                        'No se encontraron enfermedades.',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                        itemCount: _filtradas.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200, // <- ajuste clave
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.75,
                            ),
                        itemBuilder: (context, index) {
                          final e = _filtradas[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      DetailDisease(diseaseId: e.diseaseId),
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
                                      e.imagedisease,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(
                                        Icons.broken_image,
                                        size: 80,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 3, 50, 27),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      e.namedisease,
                                      style: const TextStyle(
                                        fontSize: 12,
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
