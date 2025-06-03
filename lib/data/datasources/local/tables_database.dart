import 'package:app_plants/data/datasources/local/tables/disease_table.dart';
import 'package:app_plants/data/datasources/local/tables/disease_view_history_table.dart';
import 'package:app_plants/data/datasources/local/tables/favorite_plant_table.dart';
import 'package:app_plants/data/datasources/local/tables/distribution_table.dart';
import 'package:app_plants/data/datasources/local/tables/plant_table.dart';
import 'package:app_plants/data/datasources/local/tables/plant_view_history_table.dart';
import 'package:app_plants/data/datasources/local/tables/preparation_use_table.dart';
import 'package:app_plants/data/datasources/local/tables/setting_table.dart';
import 'package:app_plants/data/datasources/local/tables/user_disease_table.dart';
import 'package:app_plants/data/datasources/local/tables/user_table.dart';
import 'package:sqflite/sqflite.dart';

// Importa todas las tablas desde su carpeta

class TablesDatabase {
  static Future<void> onCreate(Database db, int version) async {
    await UserTable.createTable(db);
    await PlantTable.createTable(db);
    await DiseaseTable.createTable(db);
    await UseTable.createTable(db);
    await DistributionTable.createTable(db);
    await UserDiseaseTable.createTable(db);
    await SettingTable.createTable(db);
    await DiseaseViewHistoryTable.createTable(db);
    await PlantViewHistoryTable.createTable(db);
    await FavoritePlantTable.createTable(db);
  }
}
