import 'package:sand/db/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart' as slUtils;

class BaseDao {
  final String tableName;

  BaseDao(this.tableName);

  Future<void> insertOne(Map<String, dynamic> map) async {
    Database db = DB.instance.database;
    await db.insert(this.tableName, map);
  }

  Future<void> insertMany(List<dynamic> list) async {
    Batch batch = DB().database.batch();
    for (int i = 0; i < list.length; i++) {
      batch.insert(this.tableName, list[i] as Map);
    }
    await batch.commit();
  }

  Future<int> getCount([Map<String, dynamic> params]) async {
    Database db = DB.instance.database;
    // String whereCaseSql;
    // TODO: make a tool
    // if (params.isNotEmpty) {
    //   String kv
    //   params.forEach((String key, dynamic value) {
    //     if (value != null) {}
    //   });
    // }
    List<Map<String, dynamic>> rs =
        await db.rawQuery('SELECT COUNT(*) AS count FROM ${this.tableName}');
    return slUtils.firstIntValue(rs);
  }
}
