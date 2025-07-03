import 'package:app_plants/data/datasources/local/tables/disease_plant_use_table.dart';
import 'package:app_plants/data/datasources/local/tables/disease_table.dart';
import 'package:app_plants/data/datasources/local/tables/disease_view_history_table.dart';
import 'package:app_plants/data/datasources/local/tables/favorite_plant_table.dart';
import 'package:app_plants/data/datasources/local/tables/distribution_table.dart';
import 'package:app_plants/data/datasources/local/tables/plant_table.dart';
import 'package:app_plants/data/datasources/local/tables/plant_view_history_table.dart';
import 'package:app_plants/data/datasources/local/tables/user_table.dart';
import 'package:sqflite/sqflite.dart';

class TablesDatabase {
  static Future<void> onCreate(Database db, int version) async {
    await UserTable.createTable(db);
    await PlantTable.createTable(db);
    await DiseaseTable.createTable(db);
    await DiseasePlantUseTable.createTable(db);
    await DistributionTable.createTable(db);
    await DiseaseViewHistoryTable.createTable(db);
    await PlantViewHistoryTable.createTable(db);
    await FavoritePlantTable.createTable(db);
  }
}
