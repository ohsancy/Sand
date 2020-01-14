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
  // 标签
  final String tag;

  Terms(this.id, this.zh_name, this.en_name, this.abbr, this.desc, this.tag);

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'zh_name': this.zh_name,
      'en_name': this.en_name,
      'abbr': this.abbr,
      'desc': this.desc,
      'tag': this.tag
    };
  }
}
