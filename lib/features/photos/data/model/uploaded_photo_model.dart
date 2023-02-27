// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:balinasoft_test/core/constants/app_constants.dart';
import 'package:equatable/equatable.dart';

class UploadedPhotoModel extends Equatable {
  const UploadedPhotoModel({
    required this.base64Image,
    required this.date,
    required this.lat,
    required this.lng,
  });

  final String base64Image;
  final DateTime date;
  final double lat;
  final double lng;

  UploadedPhotoModel copyWith({
    String? base64Image,
    DateTime? date,
    double? lat,
    double? lng,
  }) {
    return UploadedPhotoModel(
      base64Image: base64Image ?? this.base64Image,
      date: date ?? this.date,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'base64Image': base64Image,
      'date': date.millisecondsSinceEpoch / AppConstants.millisecondsInSecond,
      'lat': lat,
      'lng': lng,
    };
  }

  factory UploadedPhotoModel.fromMap(Map<String, dynamic> map) {
    return UploadedPhotoModel(
      base64Image: map['base64Image'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(
          (map['date'] as int) * AppConstants.millisecondsInSecond),
      lat: map['lat'] as double,
      lng: map['lng'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadedPhotoModel.fromJson(String source) =>
      UploadedPhotoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [base64Image, date, lat, lng];
}
