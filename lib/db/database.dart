import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_grades/stores/subject_store.dart';

class SubjectDatabase {
  SubjectDatabase._();

  static final SubjectDatabase db = SubjectDatabase._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await getDatabaseInstance();
      return database;
    }
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "client.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Subjects (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, passed INTEGER NOT NULL DEFAULT '0', trimester1 REAL, trimester2 REAL, trimester3 REAL, total REAL, remainToPass REAL)");
    });
  }

  Future<List<SubjectStore>> getAllSubjects() async {
    final db = await database;
    List response = await db.rawQuery('SELECT * FROM Subjects');
    List list =
        response.map((s) => SubjectStore.fromMap(s)).toList();
    return list;
  }

  addSubjectToDatabase(SubjectStore subject) async {
    final db = await database;
    var raw = await db.insert(
      "Subjects",
      subject.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  deleteSubjectWithId(int id) async {
    final db = await database;
    var result = db.delete("Subjects", where: "id = ?", whereArgs: [id]);
    return result;
  }

  updateSubject(SubjectStore subject) async {
    final db = await database;
    return db.update(
      "Subjects",
      subject.toMap(),
      where: "id = ?",
      whereArgs: [subject.id],
    );
  }
}
