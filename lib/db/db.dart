import 'package:path/path.dart' as path;
import 'package:sand/db/dao/terms_dao.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static final DB _instance = DB._internal();

  factory DB() => _instance;

  DB._internal();

  init() async {
    String dbPath = path.join(await getDatabasesPath(), 'sand.db');
    print('db path: $dbPath');
    openDatabase(dbPath, onCreate: (db, version) {
      Batch batch = db.batch();
      TermsDao.instance.createTable(batch);
      return batch.commit();
    },
        // 设置版本。它将执行 onCreate 方法，同时提供数据库升级和降级的路径。
        version: 1);
  }
}
