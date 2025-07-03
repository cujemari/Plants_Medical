import 'package:flutter/foundation.dart'; // ← Importante
import 'package:app_plants/data/datasources/local/tables_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static final LocalDatabase _instance = LocalDatabase._internal();

  factory LocalDatabase() => _instance;

  LocalDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (kIsWeb) {
      // 🚫 Evita usar SQLite en la Web
      throw UnsupportedError('SQLite no está disponible en Flutter Web');
    }

    if (_database != null) return _database!;
    _database = await _initDB('database.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        TablesDatabase.onCreate(db, version);
      },
    );
  }
}
