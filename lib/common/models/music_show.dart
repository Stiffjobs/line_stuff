part of models;

class MusicShowModel {
  String version; //發行版本
  String UID;
  String title; //活動名稱
  String category; //活動種類
  ShowInfoModel showInfo; //活動場次資訊
  String showUnit; //演出單位
  String discountInfo; //折扣資訊
  String descriptionFilterHtml; //簡介說明
  String imageUrl; //圖片連結
  List<String> masterUnit; //主辦單位
  List<String> subUnit; //協辦單位
  List<String> supportUnit; //贊助單位
  List<String> otherUnit; //其他單位
  String webSales; //售票網址
  String sourceWebPromote; //推廣網址
  String comment; //備注
  String sourceWebName; //來源網站名稱
  String editModifyDate; //編集時間
  int hitRate; //點閱數
  String startDate; //開始日期
  String endDate; //結束日期

  MusicShowModel({
    required this.version,
    required this.UID,
    required this.title,
    required this.category,
    required this.showInfo,
    required this.showUnit,
    required this.discountInfo,
    required this.descriptionFilterHtml,
    required this.imageUrl,
    required this.masterUnit,
    required this.subUnit,
    required this.otherUnit,
    required this.webSales,
    required this.sourceWebPromote,
    required this.comment,
    required this.sourceWebName,
    required this.editModifyDate,
    required this.hitRate,
    required this.startDate,
    required this.endDate,
    required this.supportUnit,
  });

  factory MusicShowModel.fromJson(Map<String, dynamic> json) {
    return MusicShowModel(
      version: json['version'],
      UID: json['UID'],
      title: json['title'],
      category: json['category'],
      showInfo: ShowInfoModel.fromJson(json['showInfo']),
      showUnit: json['showUnit'],
      discountInfo: json['discountInfo'],
      descriptionFilterHtml: json['descriptionFilterHtml'],
      imageUrl: json['imageUrl'],
      masterUnit: List<String>.from(json['masterUnit']),
      supportUnit: List<String>.from(json['supportUnit']),
      subUnit: List<String>.from(json['subUnit']),
      otherUnit: List<String>.from(json['otherUnit']),
      webSales: json['webSales'],
      sourceWebPromote: json['sourceWebPromote'],
      comment: json['comment'],
      sourceWebName: json['sourceWebName'],
      editModifyDate: json['editModifyDate'],
      hitRate: json['hitRate'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
}

class ShowInfoModel {
  String time; //單場次演出時間
  String location; //地址
  String locationName; //場地名稱
  String onSales; //是否售票
  String price; //售票說明
  String latitude; //緯度
  String logitude; //經度
  String endTime; //結束時間

  ShowInfoModel({
    required this.time,
    required this.location,
    required this.locationName,
    required this.onSales,
    required this.price,
    required this.latitude,
    required this.endTime,
    required this.logitude,
  });

  factory ShowInfoModel.fromJson(Map<String, dynamic> json) {
    return ShowInfoModel(
      time: json['time'],
      location: json['location'],
      locationName: json['locationName'],
      onSales: json['onSales'],
      price: json['price'],
      latitude: json['latitude'],
      logitude: json['logitude'],
      endTime: json['endTime'],
    );
  }
}
