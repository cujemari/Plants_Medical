import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/favoriteplant_repository_impl.dart';
import 'package:app_plants/presentation/wigets/plants_widgets/plant_image.dart';
import 'package:flutter/material.dart';

class PlantFavoriteScreen extends StatefulWidget {
  final MedicinalPlantModel? plant;

  const PlantFavoriteScreen({Key? key, this.plant}) : super(key: key);

  @override
  State<PlantFavoriteScreen> createState() => _PlantFavoriteRowState();
}

class _PlantFavoriteRowState extends State<PlantFavoriteScreen> {
  bool isFavorite = false;
  final FavoriteplantRepositoryImpl _favoriteRepo =
      FavoriteplantRepositoryImpl();

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    if (widget.plant == null) return;
    bool fav = await _favoriteRepo.isFavorite(widget.plant!.plantId);
    setState(() {
      isFavorite = fav;
    });
  }

  Future<void> _toggleFavorite() async {
    if (widget.plant == null) return;
    if (isFavorite) {
      await _favoriteRepo.removeFavorite(widget.plant!.plantId);
    } else {
      await _favoriteRepo.addFavorite(widget.plant!.plantId);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const SizedBox(height: 12),
              PlantImage(imagePath: widget.plant?.imageplant ?? ''),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.green,

                    size: 32,
                  ),
                  onPressed: _toggleFavorite,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
