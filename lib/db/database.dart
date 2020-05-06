import 'dart:io';
import 'package:my_grades/CONSTS.dart';
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
          "CREATE TABLE ${CONSTS.databaseSubjectsTable} (${CONSTS.databaseIdColumn} INTEGER PRIMARY KEY AUTOINCREMENT, ${CONSTS.databaseNameColumn} TEXT, ${CONSTS.databasePassedColumn} INTEGER NOT NULL DEFAULT '0', ${CONSTS.databaseTrimester1Column} REAL, ${CONSTS.databaseTrimester2Column} REAL, ${CONSTS.databaseTrimester3Column} REAL, ${CONSTS.databaseTotalColumn} REAL, ${CONSTS.databaseRemainToPassColumn} REAL)");
    });
  }

  Future<List<SubjectStore>> getAllSubjects() async {
    final db = await database;
    List response = await db.rawQuery('SELECT * FROM ${CONSTS.databaseSubjectsTable}');
    List list =
        response.map((s) => SubjectStore.fromMap(s)).toList();
    return list;
  }

  addSubjectToDatabase(SubjectStore subject) async {
    final db = await database;
    var raw = await db.insert(
      CONSTS.databaseSubjectsTable,
      subject.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  deleteSubjectWithId(int id) async {
    final db = await database;
    var result = db.delete(CONSTS.databaseSubjectsTable, where: "${CONSTS.databaseIdColumn} = ?", whereArgs: [id]);
    return result;
  }

  updateSubject(SubjectStore subject) async {
    final db = await database;
    return db.update(
      CONSTS.databaseSubjectsTable,
      subject.toMap(),
      where: "id = ?",
      whereArgs: [subject.id],
    );
  }
}
