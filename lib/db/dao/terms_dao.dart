import 'package:sqflite/sqflite.dart';

class TermsDao {
  static TermsDao instance = TermsDao._interanl();

  factory TermsDao() => instance;

  TermsDao._interanl();

  createTable(Batch batch) {
    batch.execute('''CREATE TABLE terms(
      id INTEGER PRIMARY KEY, 
      zh_name String,
      en_name String,
      abbr String,
      desc String)''');
  }
}
