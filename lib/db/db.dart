import 'package:path/path.dart' as path;
import 'package:sand/db/dao/terms_dao.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static final DB instance = DB._internal();

  Database database;

  factory DB() => instance;

  DB._internal();

  init() async {
    String dbPath = path.join(await getDatabasesPath(), 'sands.db');
    print('db path: $dbPath');
    this.database = await openDatabase(dbPath,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        // 设置版本。它将执行 onCreate 方法，同时提供数据库升级和降级的路径。
        version: 1);
  }

  _onCreate(Database db, int version) {
    Batch batch = db.batch();
    TermsDao.instance.createTable(batch);
    return batch.commit();
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {}
}
