import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

class DetailPlantViewModel {
  Future<Uri> crearEnlaceDinamico(int plantId) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://medicinal.page.link',
      link: Uri.parse('https://tuapp.com/detallePlanta?plant_id=$plantId'),
      androidParameters: AndroidParameters(
        packageName: 'com.app.plantas', // tu paquete real
        fallbackUrl: Uri.parse(
          'https://play.google.com/store/apps/details?id=com.app.plantas',
        ),
      ),
      iosParameters: IOSParameters(
        bundleId: 'com.app.plantas',
        fallbackUrl: Uri.parse('https://apps.apple.com/app/idXXXXXXXXX'),
      ),
    );

    final shortLink = await FirebaseDynamicLinks.instance.buildShortLink(
      parameters,
    );
    return shortLink.shortUrl;
  }

  Future<void> compartirPlanta(int plantId) async {
    final url = await crearEnlaceDinamico(plantId);
    Share.share('Descubre esta planta medicinal: $url');
  }
}
