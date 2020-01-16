import 'package:sand/db/dao/base_dao.dart';
import 'package:sand/db/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sand/db/constants.dart' as constants;

import '../entities/terms.dart';

class TermsDao extends BaseDao {
  static TermsDao instance = TermsDao._interanl();

  factory TermsDao() => instance;

  TermsDao._interanl() : super(constants.TABLE_TERMS);

  void createTable(Batch batch) {
    batch.execute('''CREATE TABLE terms(
      id INTEGER PRIMARY KEY, 
      zh_name TEXT,
      en_name TEXT,
      abbr TEXT,
      desc TEXT, tag TEXT)''');
  }

  Future<void> insert(Terms terms) async {
    await super.insertOne(terms.toMap());
  }

  Future<void> batchInsert(List<dynamic> list) async {
    await super.insertMany(list);
  }

  Future<List<Map<String, dynamic>>> query() async {
    Database db = DB.instance.database;
    return await db.query(this.tableName,
        columns: ['id', 'zh_name', 'en_name', 'abbr', 'desc']);
  }
}
