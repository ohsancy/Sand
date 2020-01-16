import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:sand/constants.dart' as Constants;
import 'package:sand/db/dao/terms_dao.dart';

class TermsModel {
  TermsDao termsDao;

  static TermsModel _instance;

  factory TermsModel() => getInstance();

  TermsModel._internal();

  static getInstance() {
    if (_instance == null) {
      _instance = TermsModel._internal();
      _instance.termsDao = TermsDao.instance;
      _instance._init();
    }
    return _instance;
  }

  // load data from local file
  loadData() async {
    // TermsDao termsDao = TermsDao.instance;
    int count = await this.termsDao.getCount();
    if (count > 0) return;
    String content =
        await rootBundle.loadString(Constants.TERMS_DATA_FILE_PATH);
    Uint8List data = base64.decode(content);
    content = utf8.decode(data);
    List<dynamic> jsonData = json.decode(content);
    await termsDao.batchInsert(jsonData);
  }

  _init() async {
    List list = await this.termsDao.query();
    print('list len: ${list.length}');
  }
}
