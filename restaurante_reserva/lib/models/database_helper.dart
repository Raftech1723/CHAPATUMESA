import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:restaurante_reserva/models/Restaurante.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'reservaciones.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE reservaciones(id INTEGER PRIMARY KEY, restaurante TEXT, tipomesa TEXT, precio REAL, nombre TEXT, apellido TEXT, celular TEXT, correo TEXT, fecha TEXT, hora TEXT)',
        );
      },
    );
  }

  Future<void> insertReservacion(Restaurante reservacion) async {
    final db = await database;
    await db.insert(
      'reservaciones',
      reservacion.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Restaurante>> getReservaciones() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('reservaciones');
    return List.generate(maps.length, (i) {
      return Restaurante(
        restaurante: maps[i]['restaurante'],
        tipomesa: maps[i]['tipomesa'],
        precio: maps[i]['precio'],
        nombre: maps[i]['nombre'],
        apellido: maps[i]['apellido'],
        celular: maps[i]['celular'],
        correo: maps[i]['correo'],
        fecha: maps[i]['fecha'],
        hora: maps[i]['hora'],
      );
    });
  }
}
