import 'package:sand/db/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sand/db/constants.dart' as constants;

import '../entities/terms.dart';

class TermsDao {
  static TermsDao instance = TermsDao._interanl();

  factory TermsDao() => instance;

  TermsDao._interanl();

  void createTable(Batch batch) {
    batch.execute('''CREATE TABLE terms(
      id INTEGER PRIMARY KEY, 
      zh_name TEXT,
      en_name TEXT,
      abbr TEXT,
      desc TEXT, tag TEXT)''');
  }

  void insert(Terms terms) async {
    Database db = DB().database;
    await db.insert(constants.TABLE_TERMS, terms.toMap());
  }

  void batchInsert(List<dynamic> list) async {
    Batch batch = DB().database.batch();
    for (int i = 0; i < list.length; i++) {
      batch.insert(constants.TABLE_TERMS, list[i] as Map);
    }
    await batch.commit();
  }
}
