import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/task_model.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _tasksTableName = "tasks";
  final String _tasksIdColumnName = "id";
  final String _tasksNameColumnName = "name";
  final String _tasksDescriptionColumnName = "description";
  final String _tasksStreakColumnName = "streak";
  final String _tasksIsCompletedColumnName = "isCompleted";
  final String _tasksDateColumnName = "date";

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
              $_tasksDescriptionColumnName TEXT NOT NULL,
              $_tasksStreakColumnName INTEGER NOT NULL,
              $_tasksIsCompletedColumnName INTEGER NOT NULL,
              $_tasksDateColumnName TEXT NOT NULL
            )
          ''', // Remove the extra parenthesis here
        );
      },
    );
    return database;
  }

  void addTask(
    String name,
    String description,
  ) async {
    final db = await database;
    await db.insert(
      _tasksTableName,
      {
        _tasksNameColumnName: name,
        _tasksDescriptionColumnName: description,
        _tasksStreakColumnName: 0,
        _tasksIsCompletedColumnName: 0,
        // Store as an integer (0 for false)
        _tasksDateColumnName: DateTime.now().toIso8601String(),
        // You can format the date as needed
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
            streak: e["streak"] as int,
            description: e["description"] as String,
            date: e["date"] as String,
            name: e["name"] as String,
            isCompleted: e["isCompleted"] as int, // Convert integer to bool
          ),
        )
        .toList();
    return tasks;
  }
}
