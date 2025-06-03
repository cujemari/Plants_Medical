/**import 'package:app_plants/data/models/medicinal_plant_model.dart';
import 'package:app_plants/data/repositories/plant_repository_impl.dart';

Future<void> registrarPlanta() async {
  final nuevaPlanta = MedicinalPlantModel(
    /**  plantId:
        null, // Los identificadores manuales pueden causar conflictos si ya existen
    nameplant: 'ABUTA BLANCA',
    imageplant: 'assets/images/abuta_blanca.png',
    vulgarsynomaly:
        'Trompetero sacha, sanango, caimitillo, ancabesux (siona), motelo sanango, soga; oje-ji-ka-ka (andoke), taquepuraque (kubeo), vibuajeira-mirsimarika (macuna), pancha muca (shipibo-conibo, palo de motelo (Ecuador), bofrusiri (Surinam).',
    cientificname: 'Abuta grandifolia (Mart.) Sandwith',
    family: 'Menispermaceae',
    botanicaldescription:
        'Planta silvestre, liana enredadera de tallo leñoso de forma triangular, con hebras fibrosas, de color verde oscuro. Hojas ovaladas, flores de color rojo. Florece en la época de invierno.',
    habitat:
        'De climas cálidos, bosque primario, bosque secundario. Desarrolla en altitudes de 0 a 600 m.',
    chemicalcomposition:
        'Saponinas, flavonas, alcaloides (bencil-isoquinolínico, palmatina) y taninos.',
    syncStatus: 'pendiente',
    lastUpdated: DateTime.now().millisecondsSinceEpoch,*/
    /**  plantId:
        003, // Los identificadores manuales pueden causar conflictos si ya existen
    nameplant: 'ACHIOTE',
    imageplant: 'assets/images/achiote.png',
    vulgarsynomaly: 'Achiote',
    cientificname: 'Bixa orellana L.',
    family: 'Bixaceae',
    botanicaldescription:
        'Arbusto de 1-3 m de altura a más. Hojas alternas pecioladas, simples, cordadas, puntiagudas. Flores se agrupan en panojas terminales rosadas o blancas. Fruto capsula dehiscente ovoide punteaguda o acorazonada de 3 a 5 cm de largo y agrupadas en racimos, su superficie generalmente cubierta por apéndices espinosos. Semillas cubiertas por un arilo o carnosidad, pulposo, pegajoso o resinoso de color rojo o anaranjado.',
    habitat:
        'Planta cultivada de los valles montanos de las zonas cálido-tropical. Rango altitudinal 0 a 3000 m.',
    chemicalcomposition:
        'Las semillas contienen bixina (colorante rojo), norbixina, cripthoxantina, euxina y metilbixina. También proteína, vitaminas C, azucares y hierro, además beta-caroteno. En las hojas se halla flavonoides y un derivado sesquiterpenico. Taninos y saponinas.',
    syncStatus: 'pendiente',
    lastUpdated: DateTime.now().millisecondsSinceEpoch,*/
    plantId:1, // Los identificadores manuales pueden causar conflictos si ya existen
    nameplant: 'BOLSA MULLACA',
    imageplant: 'assets/images/bolsa_mullaca.png',
    vulgarsynomaly: 'Mullaca; capulí cimarrón; shimon (shipibo-conibo).',
    cientificname: 'Physalis angulata L.',
    family: 'Solanaceae',
    botanicaldescription:
        'Hierba anual de hasta 1 m de altura. Tallo ramificado, grueso, fistuloso, verde o parduzco, glabro y carnoso, triangular en la parte inferior y cuadrangular en la superior, así como en las ramas. Hojas alternas, ovadas, ovado-lanceoladas, ovado oblongas, cuneadas en la base. Flores solitarias de 8 a 10 mm de largo de color crema; cáliz sub-angulado y acrescente, pedúnculo recurvado sin mácula y con anteras violáceas. Fruto en baya amarillo verdosa incluida totalmente en el cáliz Semillas reniformes, comprimidas, rufescentes, de 1,5 mm de longitud.',
    habitat:
        'Planta invasora de amplia distribución en los países cálidos. Crece en lugares abiertos, entre cultivos.',
    chemicalcomposition:
        'Tizalina, tropeira, higrina, proteínas y vitaminas A y C. El género Physalis, presenta alcaloides del tipo higrina y/o tropano (ubicados en la raíz), glicósidos, flavonoides, physalinas y principios amargos.',
    syncStatus: 'pendiente',
    lastUpdated: DateTime.now().millisecondsSinceEpoch,

    /** plantId:
        005, // Los identificadores manuales pueden causar conflictos si ya existen
    nameplant: 'ABUTA COLORADA',
    imageplant: 'assets/images/abuta_colorada.png',
    vulgarsynomaly:
        'Jimi mashaman rao (Shipibo-Conibo), yairipini (Machiguenga), cochllepar (Yanesha).',
    cientificname: 'Paullinia bracteosa Radlkofer',
    family: 'Sapindaceae',
    botanicaldescription:
        'Planta silvestre, liana enredadera de tallo leñoso de forma triangular, con hebras fibrosas, de color verde oscuro. Hojas ovaladas, flores de color rojo. Florece en la época de invierno.',
    habitat:
        'Soga que crece en el bajío. Desarrolla en altitudes de 0 a 600 m.',
    chemicalcomposition: 'No reportada',
    syncStatus: 'pendiente',
    lastUpdated: DateTime.now().millisecondsSinceEpoch,

    /**plantId:
        006, // Los identificadores manuales pueden causar conflictos si ya existen
    nameplant: 'ABUTA COLORADA',
    imageplant: 'assets/images/abuta_colorada.png',
    vulgarsynomaly:
        'Jimi mashaman rao (Shipibo-Conibo), yairipini (Machiguenga), cochllepar (Yanesha).',
    cientificname: 'Paullinia bracteosa Radlkofer',
    family: 'Sapindaceae',
    botanicaldescription:
        'Planta silvestre, liana enredadera de tallo leñoso de forma triangular, con hebras fibrosas, de color verde oscuro. Hojas ovaladas, flores de color rojo. Florece en la época de invierno.',
    habitat:
        'Soga que crece en el bajío. Desarrolla en altitudes de 0 a 600 m.',*/
    chemicalcomposition: 'No reportada',
    syncStatus: 'pendiente',
    lastUpdated: DateTime.now().millisecondsSinceEpoch,*/

    /**plantId:
        007, // Los identificadores manuales pueden causar conflictos si ya existen
    nameplant: 'ABUTA COLORADA',
    imageplant: 'assets/images/abuta_colorada.png',
    vulgarsynomaly:
        'Jimi mashaman rao (Shipibo-Conibo), yairipini (Machiguenga), cochllepar (Yanesha).',
    cientificname: 'Paullinia bracteosa Radlkofer',
    family: 'Sapindaceae',
    botanicaldescription:
        'Planta silvestre, liana enredadera de tallo leñoso de forma triangular, con hebras fibrosas, de color verde oscuro. Hojas ovaladas, flores de color rojo. Florece en la época de invierno.',
    habitat:
        'Soga que crece en el bajío. Desarrolla en altitudes de 0 a 600 m.',
    chemicalcomposition: 'No reportada',
    syncStatus: 'pendiente',
    lastUpdated: DateTime.now().millisecondsSinceEpoch,*/

    /**plantId:
        008, // Los identificadores manuales pueden causar conflictos si ya existen
    nameplant: 'ABUTA COLORADA',
    imageplant: 'assets/images/abuta_colorada.png',
    vulgarsynomaly:
        'Jimi mashaman rao (Shipibo-Conibo), yairipini (Machiguenga), cochllepar (Yanesha).',
    cientificname: 'Paullinia bracteosa Radlkofer',
    family: 'Sapindaceae',
    botanicaldescription:
        'Planta silvestre, liana enredadera de tallo leñoso de forma triangular, con hebras fibrosas, de color verde oscuro. Hojas ovaladas, flores de color rojo. Florece en la época de invierno.',
    habitat:
        'Soga que crece en el bajío. Desarrolla en altitudes de 0 a 600 m.',
    chemicalcomposition: 'No reportada',
    syncStatus: 'pendiente',
    lastUpdated: DateTime.now().millisecondsSinceEpoch,*/

    /** plantId:
        009, // Los identificadores manuales pueden causar conflictos si ya existen
    nameplant: 'ABUTA COLORADA',
    imageplant: 'assets/images/abuta_colorada.png',
    vulgarsynomaly:
        'Jimi mashaman rao (Shipibo-Conibo), yairipini (Machiguenga), cochllepar (Yanesha).',
    cientificname: 'Paullinia bracteosa Radlkofer',
    family: 'Sapindaceae',
    botanicaldescription:
        'Planta silvestre, liana enredadera de tallo leñoso de forma triangular, con hebras fibrosas, de color verde oscuro. Hojas ovaladas, flores de color rojo. Florece en la época de invierno.',
    habitat:
        'Soga que crece en el bajío. Desarrolla en altitudes de 0 a 600 m.',
    chemicalcomposition: 'No reportada',
    syncStatus: 'pendiente',
    lastUpdated: DateTime.now().millisecondsSinceEpoch,*/

    /**plantId:
        010, // Los identificadores manuales pueden causar conflictos si ya existen
    nameplant: 'ABUTA COLORADA',
    imageplant: 'assets/images/abuta_colorada.png',
    vulgarsynomaly:
        'Jimi mashaman rao (Shipibo-Conibo), yairipini (Machiguenga), cochllepar (Yanesha).',
    cientificname: 'Paullinia bracteosa Radlkofer',
    family: 'Sapindaceae',
    botanicaldescription:
        'Planta silvestre, liana enredadera de tallo leñoso de forma triangular, con hebras fibrosas, de color verde oscuro. Hojas ovaladas, flores de color rojo. Florece en la época de invierno.',
    habitat:
        'Soga que crece en el bajío. Desarrolla en altitudes de 0 a 600 m.',
    chemicalcomposition: 'No reportada',
    syncStatus: 'pendiente',
    lastUpdated: DateTime.now().millisecondsSinceEpoch,*/

    /**plantId:
        011, // Los identificadores manuales pueden causar conflictos si ya existen
    nameplant: 'ABUTA COLORADA',
    imageplant: 'assets/images/abuta_colorada.png',
    vulgarsynomaly:
        'Jimi mashaman rao (Shipibo-Conibo), yairipini (Machiguenga), cochllepar (Yanesha).',
    cientificname: 'Paullinia bracteosa Radlkofer',
    family: 'Sapindaceae',
    botanicaldescription:
        'Planta silvestre, liana enredadera de tallo leñoso de forma triangular, con hebras fibrosas, de color verde oscuro. Hojas ovaladas, flores de color rojo. Florece en la época de invierno.',
    habitat:
        'Soga que crece en el bajío. Desarrolla en altitudes de 0 a 600 m.',
    chemicalcomposition: 'No reportada',
    syncStatus: 'pendiente',
    lastUpdated: DateTime.now().millisecondsSinceEpoch,*/
  );

  final dbService = PlantRepositoryImpl();
  await dbService.insertarPlanta(
    nuevaPlanta,
  ); // Este método debe estar definido en LocalDatabaseService
}*/
