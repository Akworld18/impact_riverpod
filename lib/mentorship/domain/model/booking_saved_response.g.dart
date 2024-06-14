// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_saved_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingSavedResponse _$BookingSavedResponseFromJson(
        Map<String, dynamic> json) =>
    BookingSavedResponse(
      BookingSavedData.fromJson(json['data'] as Map<String, dynamic>),
      json['status'] as String? ?? '',
    );

Map<String, dynamic> _$BookingSavedResponseToJson(
        BookingSavedResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

BookingSavedData _$BookingSavedDataFromJson(Map<String, dynamic> json) =>
    BookingSavedData(
      json['message'] as String? ?? '',
    );

Map<String, dynamic> _$BookingSavedDataToJson(BookingSavedData instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
