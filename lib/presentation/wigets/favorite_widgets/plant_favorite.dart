import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/favoriteplant_repository_impl.dart';
import 'package:app_plants/presentation/wigets/plants_widgets/plant_image.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

class PlantFavorite extends StatefulWidget {
  final MedicinalPlantModel? plant;

  const PlantFavorite({Key? key, this.plant}) : super(key: key);

  @override
  State<PlantFavorite> createState() => _PlantFavoriteRowState();
}

class _PlantFavoriteRowState extends State<PlantFavorite> {
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
    final fav = await _favoriteRepo.isFavorite(widget.plant!.plantId);
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

  Future<void> _compartirPlanta() async {
    if (widget.plant == null) return;

    final parameters = DynamicLinkParameters(
      uriPrefix: 'https://plantasmedicinal.page.link',
      link: Uri.parse(
        'https://plantasmedicinal.page.link/planta?id=${widget.plant!.plantId}',
      ),
      androidParameters: AndroidParameters(
        packageName: 'pe.gob.iiap.plantasmedicinal',
        fallbackUrl: Uri.parse(
          'https://play.google.com/store/apps/details?id=pe.gob.iiap.plantasmedicinal',
        ),
      ),
    );

    final shortUrl = (await FirebaseDynamicLinks.instance.buildShortLink(
      parameters,
    )).shortUrl;

    await Share.share(
      '🪴🌿¡Descubre las propiedades curativas de la planta medicinal de la AmazonÍa Peruana: "${widget.plant!.nameplant}"!\nMira más aquí: $shortUrl',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              PlantImage(imagePath: widget.plant?.imageplant ?? ''),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.tealAccent,
                        size: 32,
                      ),
                      onPressed: _toggleFavorite,
                    ),
                    IconButton(
                      onPressed: _compartirPlanta,
                      icon: const Icon(
                        Icons.share,
                        color: Colors.blue,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
