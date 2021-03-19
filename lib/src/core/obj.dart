import 'package:json_annotation/json_annotation.dart';

class CacheObj {
  String key;
  String subKey;
  @JsonKey(name: "max_age_date")
  int maxAgeDate;
  @JsonKey(name: "max_stale_date")
  int maxStaleDate;
  List<int> content;
  int statusCode;
  List<int> headers;

  CacheObj._(
      this.key, this.subKey, this.content, this.statusCode, this.headers);

  factory CacheObj(String key, List<int> content,
      {String subKey = "",
      Duration maxAge,
      Duration maxStale,
      int statusCode = 200,
      List<int> headers}) {
    return CacheObj._(key, subKey, content, statusCode, headers)
      ..maxAge = maxAge
      ..maxStale = maxStale;
  }

  set maxAge(Duration duration) {
    if (null != duration) this.maxAgeDate = _convertDuration(duration);
  }

  set maxStale(Duration duration) {
    if (null != duration) this.maxStaleDate = _convertDuration(duration);
  }

  _convertDuration(Duration duration) =>
      DateTime.now().add(duration).millisecondsSinceEpoch;

  factory CacheObj.fromJson(Map<String, dynamic> json) {
    return CacheObj(
      json['key'] as String,
      (json['content'] as List)?.map((e) => e as int)?.toList(),
      subKey: json['subKey'] as String,
      statusCode: json['statusCode'] as int,
      headers: (json['headers'] as List)?.map((e) => e as int)?.toList(),
    )
      ..maxAgeDate = json['max_age_date'] as int
      ..maxStaleDate = json['max_stale_date'] as int;
  }
}
