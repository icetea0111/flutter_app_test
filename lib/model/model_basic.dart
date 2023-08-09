
import 'dart:convert';

Basic basicFromJson(String str) => Basic.fromJson(json.decode(str));

String basicToJson(Basic data) => json.encode(data.toJson());

class Basic {
  String code;
  Data data;
  String message;

  Basic({
    required this.code,
    required this.data,
    required this.message,
  });

  factory Basic.fromJson(Map<String, dynamic> json) => Basic(
    code: json["code"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  int prdId;
  int dplId;
  String productName;
  String productDisplayName;
  DateTime reserveDt;
  int riderCount;
  List<TimeList> timeList;
  int ticketPrice;
  int ticketSalePrice;

  Data({
    required this.prdId,
    required this.dplId,
    required this.productName,
    required this.productDisplayName,
    required this.reserveDt,
    required this.riderCount,
    required this.timeList,
    required this.ticketPrice,
    required this.ticketSalePrice,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    prdId: json["prdId"],
    dplId: json["dplId"],
    productName: json["productName"],
    productDisplayName: json["productDisplayName"],
    reserveDt: DateTime.parse(json["reserveDt"]),
    riderCount: json["riderCount"],
    timeList: List<TimeList>.from(json["timeList"].map((x) => TimeList.fromJson(x))),
    ticketPrice: json["ticketPrice"],
    ticketSalePrice: json["ticketSalePrice"],
  );

  Map<String, dynamic> toJson() => {
    "prdId": prdId,
    "dplId": dplId,
    "productName": productName,
    "productDisplayName": productDisplayName,
    "reserveDt": "${reserveDt.year.toString().padLeft(4, '0')}-${reserveDt.month.toString().padLeft(2, '0')}-${reserveDt.day.toString().padLeft(2, '0')}",
    "riderCount": riderCount,
    "timeList": List<dynamic>.from(timeList.map((x) => x.toJson())),
    "ticketPrice": ticketPrice,
    "ticketSalePrice": ticketSalePrice,
  };
}

class TimeList {
  String timeSlot;
  String stcDetailId;
  dynamic stockStartTime;
  dynamic stockEndTime;
  bool stockUseYn;
  int stockCount;
  int totStockCount;
  bool enabled;
  dynamic operationStopYn;
  dynamic appOnlyYn;
  List<ProductDetailList> productDetailList;
  dynamic optionList;
  StockStatusStr stockStatusStr;
  int stockStatus;

  TimeList({
    required this.timeSlot,
    required this.stcDetailId,
    this.stockStartTime,
    this.stockEndTime,
    required this.stockUseYn,
    required this.stockCount,
    required this.totStockCount,
    required this.enabled,
    this.operationStopYn,
    this.appOnlyYn,
    required this.productDetailList,
    this.optionList,
    required this.stockStatusStr,
    required this.stockStatus,
  });

  factory TimeList.fromJson(Map<String, dynamic> json) => TimeList(
    timeSlot: json["timeSlot"],
    stcDetailId: json["stcDetailId"],
    stockStartTime: json["stockStartTime"],
    stockEndTime: json["stockEndTime"],
    stockUseYn: json["stockUseYn"],
    stockCount: json["stockCount"],
    totStockCount: json["totStockCount"],
    enabled: json["enabled"],
    operationStopYn: json["operationStopYn"],
    appOnlyYn: json["appOnlyYn"],
    productDetailList: List<ProductDetailList>.from(json["productDetailList"].map((x) => ProductDetailList.fromJson(x))),
    optionList: json["optionList"],
    stockStatusStr: stockStatusStrValues.map[json["stockStatusStr"]]!,
    stockStatus: json["stockStatus"],
  );

  Map<String, dynamic> toJson() => {
    "timeSlot": timeSlot,
    "stcDetailId": stcDetailId,
    "stockStartTime": stockStartTime,
    "stockEndTime": stockEndTime,
    "stockUseYn": stockUseYn,
    "stockCount": stockCount,
    "totStockCount": totStockCount,
    "enabled": enabled,
    "operationStopYn": operationStopYn,
    "appOnlyYn": appOnlyYn,
    "productDetailList": List<dynamic>.from(productDetailList.map((x) => x.toJson())),
    "optionList": optionList,
    "stockStatusStr": stockStatusStrValues.reverse[stockStatusStr],
    "stockStatus": stockStatus,
  };
}

class ProductDetailList {
  int prdDetailId;
  String entranceStartTime;
  String entranceEndTime;
  int orderNo;

  ProductDetailList({
    required this.prdDetailId,
    required this.entranceStartTime,
    required this.entranceEndTime,
    required this.orderNo,
  });

  factory ProductDetailList.fromJson(Map<String, dynamic> json) => ProductDetailList(
    prdDetailId: json["prdDetailId"],
    entranceStartTime: json["entranceStartTime"],
    entranceEndTime: json["entranceEndTime"],
    orderNo: json["orderNo"],
  );

  Map<String, dynamic> toJson() => {
    "prdDetailId": prdDetailId,
    "entranceStartTime": entranceStartTime,
    "entranceEndTime": entranceEndTime,
    "orderNo": orderNo,
  };
}

enum StockStatusStr {
  EMPTY,
  PURPLE,
  STOCK_STATUS_STR
}

final stockStatusStrValues = EnumValues({
  "재고부족": StockStatusStr.EMPTY,
  "여유": StockStatusStr.PURPLE,
  "보통": StockStatusStr.STOCK_STATUS_STR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
