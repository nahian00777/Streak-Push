import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/task_model.dart';
import 'dart:convert';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _tasksTableName = "tasks";
  final String _tasksIdColumnName = "id";
  final String _tasksNameColumnName = "name";
  final String _tasksIconColumnName = "icon";
  final String _tasksStreakColumnName = "streak";
  final String _tasksIsCompletedColumnName = "isCompleted";
  final String _tasksDateCreatedColumnName = "dateCreated";
  final String _tasksReminderTimeColumnName = "reminderTime";
  final String _tasksFreqColumnName = "freq";

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "streak_push.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
            CREATE TABLE $_tasksTableName (
              $_tasksIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
              $_tasksNameColumnName TEXT NOT NULL,
              $_tasksIconColumnName TEXT NOT NULL,
              $_tasksStreakColumnName INTEGER NOT NULL,
              $_tasksIsCompletedColumnName INTEGER NOT NULL,
              $_tasksDateCreatedColumnName TEXT NOT NULL,
              $_tasksReminderTimeColumnName TEXT NOT NULL,
              $_tasksFreqColumnName TEXT NOT NULL         
            )
          ''', // Remove the extra parenthesis here
        );
      },
    );
    return database;
  }

  void addTask(
    String name,
    String icon,
    List<int> freq,
    String reminderTime,
    String dateCreated,
  ) async {
    final db = await database;

    await db.insert(
      _tasksTableName,
      {
        _tasksNameColumnName: name,
        _tasksIconColumnName: icon,
        _tasksStreakColumnName: 0,
        _tasksIsCompletedColumnName: 0,
        // 0 indicates task is not completed
        _tasksDateCreatedColumnName: DateTime.now().toIso8601String(),
        // Store current date in ISO format
        _tasksReminderTimeColumnName: reminderTime,
        // Store reminder time
        _tasksFreqColumnName: jsonEncode(freq),
        // Convert freq list to JSON string and store it
      },
    );
  }

  Future<List<Task>?> getTasks() async {
    final db = await database;
    final data = await db.query(_tasksTableName);

    List<Task> tasks = data
        .map(
          (e) => Task(
            id: e["id"] as int,
            name: e["name"] as String,
            streak: e["streak"] as int,
            isCompleted: e["isCompleted"] as int,
            // Integer remains as int, no conversion needed
            dateCreated: e["dateCreated"] as String,
            reminderTime: e["reminderTime"] as String,
            icon: e["icon"] as String,
            freq: List<int>.from(jsonDecode(e["freq"]
                as String)), // Parse freq from JSON string to List<int>
          ),
        )
        .toList();
    return tasks;
  }
}
