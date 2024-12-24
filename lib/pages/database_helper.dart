import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  Database? _database;

  DatabaseHelper._internal();

  // Veritabanını başlat
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Veritabanını başlatma
  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'terms.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Veritabanı tablosu oluşturma
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE terms (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        term TEXT,
        turkish TEXT,
        example TEXT
      )
    ''');
  }

  // Terimleri veritabanına ekleme
  Future<void> insertTerm(Map<String, dynamic> term) async {
    final db = await database;
    await db.insert('terms', term, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Tüm terimleri okuma
  Future<List<Map<String, dynamic>>> getAllTerms() async {
    final db = await database;
    return await db.query('terms');
  }

  // Terimi güncelleme
  Future<void> updateTerm(int id, Map<String, dynamic> term) async {
    final db = await database;
    await db.update(
      'terms',
      term,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Terimi silme
  Future<void> deleteTerm(int id) async {
    final db = await database;
    await db.delete('terms', where: 'id = ?', whereArgs: [id]);
  }
}
