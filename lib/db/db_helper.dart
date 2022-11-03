import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../model/task.dart';


class DBHelper {
  static const int _version = 1;
  static const String _tableName = "tasks_table";
  static const String _databaseName = "tasks.db";
  static Database? _db;
  static const _columnId = "id";
  static const _columnTitle = "title";
  static const _columnIsDone = "isDone";


  static Future<void> initDatabase() async {
    if (_db != null) {
      return;
    }
    try {
      final dbPath = await getDatabasesPath();
      String path = p.join(dbPath, _databaseName);

      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          print("Creating DB");
          return db.execute(
            "CREATE TABLE $_tableName("
                "$_columnId INTEGER PRIMARY KEY AUTOINCREMENT, "
                "$_columnTitle STRING,"
                "$_columnIsDone INTEGER "
                ")",
          );
        },
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error to open DB: ${error.toString()}');
      }
    }
  }

  static Future<int> insert(Task task) async {
    return await _db?.insert(_tableName, task.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>?> query() async {
    return await _db?.query(_tableName);
  }

  static Future<void> delete(Task task) async {
    await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }

  static Future<void> update(int id) async {
    await _db!.rawUpdate('''
    UPDATE $_tableName
    SET $_columnIsDone = ?
    WHERE id =?
    ''', [1, id]);
  }

  static Future<void> updateTitle(int id, String title) async {
    await _db!.rawUpdate('''
    UPDATE $_tableName
    SET $_columnTitle = ?
    WHERE id =?
    ''', [title, id]);
  }

  static Future<void> updateTask(Task task) async {
    await _db!.rawUpdate('''
    UPDATE $_tableName
    SET $_columnTitle = ?, $_columnIsDone = ?
    WHERE id =?
    ''', [task.title, task.isDone, task.id]);
  }

  // static Future<void> updateFav(int id) async {
  //   await _db!.rawUpdate('''
  //   UPDATE $_tableName
  //   SET $_columnIsFavorite = ?
  //   WHERE id =?
  //   ''', [1, id]);
  // }

  // static Future<void> removeFav(int id) async {
  //   await _db!.rawUpdate(
  //     '''
  //   UPDATE $_tableName
  //   SET $_columnIsFavorite = ? WHERE id =?''',
  //     [0, id],
  //   );
  // }

  // static Future<void> updateTaskStatus(int id, String status) async {
  //   await _db!.rawUpdate('''
  //   UPDATE $_tableName
  //   SET $_columnStatus = ?
  //   WHERE id =?
  //   ''', [status, id]);
  // }

  static Future<List<Map<String, dynamic>>> queryTaskById(int id) async {
    return await _db!.query(_tableName, where: '$_columnId=?', whereArgs: [id]);
  }
}