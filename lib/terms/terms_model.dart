import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:sand/constants.dart' as Constants;
import 'package:sand/db/dao/terms_dao.dart';

class TermsModel {
  static TermsModel instance = TermsModel._internal();

  factory TermsModel() => instance;

  TermsModel._internal();

  // load data from local file
  loadData() async {
    String content =
        await rootBundle.loadString(Constants.TERMS_DATA_FILE_PATH);
    Uint8List data = base64.decode(content);
    content = utf8.decode(data);
    List<dynamic> jsonData = json.decode(content);
    TermsDao.instance.batchInsert(jsonData);
  }
}
