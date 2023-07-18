import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../models/item_model.dart';
import './repository.dart';

class NewsDbProvider implements Source {
  late Database db;
  
  // Todo - store and fetch top ids
  Future<List<int>> fetchToIds() {
    return null;
  }

  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
            CREATE TABLE Items
              (
                id INTEGER PRIMARY KEY,
                type TEXT,
                by TEXT,
                time INTEGER,
                text TEXT,
                parent INTEGER,
                kids BLOB,
                dead INTEGER,
                deleted INTEGER,
                url TEXT,
                score INTEGER,
                title TEXT,
                descendants INTEGER
              )
        """);
      },
    );
  }

  Future<ItemModel?> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ItemModel.fromDb(maps.first);
    }

    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMapForDb());
  }
}
