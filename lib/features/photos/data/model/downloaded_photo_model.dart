import 'dart:convert';

import 'package:balinasoft_test/core/constants/app_constants.dart';
import 'package:equatable/equatable.dart';

class DownloadedPhotoModel extends Equatable {
  const DownloadedPhotoModel({
    required this.id,
    required this.url,
    required this.date,
    required this.lat,
    required this.lng,
  });

  final int id;
  final String url;
  final DateTime date;
  final double lat;
  final double lng;

  DownloadedPhotoModel copyWith({
    int? id,
    String? url,
    DateTime? date,
    double? lat,
    double? lng,
  }) {
    return DownloadedPhotoModel(
      id: id ?? this.id,
      url: url ?? this.url,
      date: date ?? this.date,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'date': date.millisecondsSinceEpoch / AppConstants.millisecondsInSecond,
      'lat': lat,
      'lng': lng,
    };
  }

  factory DownloadedPhotoModel.fromMap(Map<String, dynamic> map) {
    return DownloadedPhotoModel(
      id: map['id'] as int,
      url: map['url'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(
          (map['date'] as int) * AppConstants.millisecondsInSecond),
      lat: map['lat'] as double,
      lng: map['lng'] as double,
    );
  }

  static List<DownloadedPhotoModel> fromList(Map<String, dynamic> map) {
    return (map['data'] as List<dynamic>)
        .map((photoJson) => DownloadedPhotoModel.fromMap(photoJson))
        .toList();
  }

  String toJson() => json.encode(toMap());

  factory DownloadedPhotoModel.fromJson(String source) =>
      DownloadedPhotoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory DownloadedPhotoModel.fromResponseJson(String source) =>
      DownloadedPhotoModel.fromMap((json.decode(source) as Map<String, dynamic>)['data']);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, url, date, lat, lng];
}
