import 'package:sand/db/dao/base_dao.dart';
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

  insert(Terms terms) async {
    await super.insertOne(terms.toMap());
  }

  batchInsert(List<dynamic> list) async {
    await super.insertMany(list);
  }
}
