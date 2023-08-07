class CaseResponse {
  CaseResponse({
    bool? isImage,
    List<Data>? data,
  }) {
    _isImage = isImage;
    _data = data;
  }

  CaseResponse.fromJson(dynamic json) {
    _isImage = json['isImage'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  bool? _isImage;
  List<Data>? _data;

  bool? get isImage => _isImage;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isImage'] = _isImage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// seq : 1
/// 事故年月 : "11101"
/// 總編號 : "10013"
/// 案件編號 : "K070443"
/// 處理單位 : "VW00"
/// 單位名稱 : "岡山分局"
/// 事故類別 : "A1"
/// 處理編號 : "603"
/// 發生日期 : "2022/1/25 上午 11:53:00"
/// 縣市 : "高雄市"
/// 鄉鎮市區 : "橋頭區"
/// 村里 : "村"
/// 鄰 : ""
/// 街路 : "仕豐路"
/// 段 : ""
/// 街路交岔路 : ""
/// 段交岔路 : ""
/// 發生地點 : ""
/// 公路 : ""
/// 公里 : "0"
/// 公尺 : "0"
/// 車道方向 : ""
/// 線 : ""
/// 公里平交道 : "0"
/// 公尺平交道 : "0"
/// 名稱平交道 : ""
/// 死亡人數 : "1"
/// 受傷人數 : "0"
/// 天候 : "8"
/// 天候說明 : "晴"
/// 光線 : "1"
/// 光線說明 : "日間自然光線"
/// 道路類別 : "5"
/// 道路說明 : "市區道路"
/// 速限 : "40"
/// 道路型態 : "14"
/// 道路型態說明 : "直路"
/// 事故位置 : "08"
/// 事故位置說明 : "慢車道"
/// 路面鋪裝 : "1"
/// 路面鋪裝說明 : "柏油"
/// 路面狀態 : "5"
/// 路面狀態說明 : "乾燥"
/// 路面缺陷 : "4"
/// 路面缺陷說明 : "無缺陷"
/// 障礙物 : "5"
/// 障礙物說明 : "無障礙物"
/// 視距 : "7"
/// 視距說明 : "良好"
/// 號誌種類 : "4"
/// 號誌種類說明 : "無號誌"
/// 號誌動作 : "4"
/// 號誌動作說明 : "無號誌"
/// 分向設施 : "09"
/// 分向設施說明 : "無標記"
/// 快車道 : "5"
/// 快車道說明 : "未繪設車道線"
/// 快慢車道 : "4"
/// 快慢車道說明 : "快慢車道分隔線"
/// 路面邊線 : "1"
/// 路面邊線說明 : "有"
/// 事故類型及型態 : "26"
/// 事故類型及型態說明 : "撞路樹、電桿"
/// 2至30日死亡 : "0"
/// 監視影帶 : "Y"
/// x : "22.74699"
/// y : "120.3038"

class Data {
  Data({
    int? seq,
    String? caseNumber,
    String? companyName,
    String? occurrenceDate,
  }) {
    _seq = seq;
    _caseNumber = caseNumber;
    _companyName = companyName;
    _occurrenceDate = occurrenceDate;
  }

  Data.fromJson(dynamic json) {
    _seq = json['seq'];
    _caseNumber = json['案件編號'];
    _companyName = json['單位名稱'];
    _occurrenceDate = json['發生日期'];
  }

  int? _seq;
  String? _caseNumber;
  String? _companyName;
  String? _occurrenceDate;

  int? get seq => _seq;

  String? get caseNumber => _caseNumber;

  String? get companyName => _companyName;

  String? get occurrenceDate => _occurrenceDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seq'] = _seq;
    map['案件編號'] = _caseNumber;
    map['單位名稱'] = _companyName;
    map['發生日期'] = _occurrenceDate;
    return map;
  }
}
