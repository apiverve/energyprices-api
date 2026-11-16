/// Response models for the Energy Prices API.

/// API Response wrapper.
class EnergypricesResponse {
  final String status;
  final dynamic error;
  final EnergypricesData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  EnergypricesResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory EnergypricesResponse.fromJson(Map<String, dynamic> json) => EnergypricesResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? EnergypricesData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Energy Prices API.

class EnergypricesData {
  num? count;
  String? date;
  List<EnergypricesDataPricesItem>? prices;

  EnergypricesData({
    this.count,
    this.date,
    this.prices,
  });

  factory EnergypricesData.fromJson(Map<String, dynamic> json) => EnergypricesData(
      count: json['count'],
      date: json['date'],
      prices: (json['prices'] as List?)?.map((e) => EnergypricesDataPricesItem.fromJson(e)).toList(),
    );
}

class EnergypricesDataPricesItem {
  String? benchmark;
  String? name;
  String? product;
  String? location;
  String? currency;
  String? unit;
  String? nativeUnit;
  num? price;
  String? date;
  num? previousClose;
  String? previousDate;
  num? change;
  num? changePercent;
  String? changeDirection;
  num? high52w;
  String? high52wDate;
  num? low52w;
  String? low52wDate;

  EnergypricesDataPricesItem({
    this.benchmark,
    this.name,
    this.product,
    this.location,
    this.currency,
    this.unit,
    this.nativeUnit,
    this.price,
    this.date,
    this.previousClose,
    this.previousDate,
    this.change,
    this.changePercent,
    this.changeDirection,
    this.high52w,
    this.high52wDate,
    this.low52w,
    this.low52wDate,
  });

  factory EnergypricesDataPricesItem.fromJson(Map<String, dynamic> json) => EnergypricesDataPricesItem(
      benchmark: json['benchmark'],
      name: json['name'],
      product: json['product'],
      location: json['location'],
      currency: json['currency'],
      unit: json['unit'],
      nativeUnit: json['nativeUnit'],
      price: json['price'],
      date: json['date'],
      previousClose: json['previousClose'],
      previousDate: json['previousDate'],
      change: json['change'],
      changePercent: json['changePercent'],
      changeDirection: json['changeDirection'],
      high52w: json['high52w'],
      high52wDate: json['high52wDate'],
      low52w: json['low52w'],
      low52wDate: json['low52wDate'],
    );
}

class EnergypricesRequest {
  String? benchmark;
  String? unit;
  String? date;
  String? history;
  int? days;

  EnergypricesRequest({
    this.benchmark,
    this.unit,
    this.date,
    this.history,
    this.days,
  });

  Map<String, dynamic> toJson() => {
      if (benchmark != null) 'benchmark': benchmark,
      if (unit != null) 'unit': unit,
      if (date != null) 'date': date,
      if (history != null) 'history': history,
      if (days != null) 'days': days,
    };
}
