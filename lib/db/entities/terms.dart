/// 词条实体类
class Terms {
  final int id;
  // 中文名称
  final String zh_name;
  // 英文名称
  final String en_name;
  // 名称缩写
  final String abbr;
  // 描述
  final String desc;

  Terms(this.id, this.zh_name, this.en_name, this.abbr, this.desc);
}
