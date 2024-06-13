// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorSessionResponse _$MentorSessionResponseFromJson(
        Map<String, dynamic> json) =>
    MentorSessionResponse(
      json['status'] as String? ?? '',
      MentorSessionDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorSessionResponseToJson(
        MentorSessionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

MentorSessionDataModel _$MentorSessionDataModelFromJson(
        Map<String, dynamic> json) =>
    MentorSessionDataModel(
      json['message'] as String? ?? '',
      MentorResponseData.fromJson(json['responseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorSessionDataModelToJson(
        MentorSessionDataModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'responseData': instance.responseData,
    };

MentorResponseData _$MentorResponseDataFromJson(Map<String, dynamic> json) =>
    MentorResponseData(
      MentorAvailability.fromJson(json['availability'] as Map<String, dynamic>),
      json['server_time'] as String? ?? '',
    );

Map<String, dynamic> _$MentorResponseDataToJson(MentorResponseData instance) =>
    <String, dynamic>{
      'availability': instance.availability,
      'server_time': instance.server_time,
    };

MentorAvailability _$MentorAvailabilityFromJson(Map<String, dynamic> json) =>
    MentorAvailability(
      (json['friday'] as List<dynamic>?)
              ?.map((e) =>
                  MentorAvailabilityDates.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['monday'] as List<dynamic>?)
              ?.map((e) =>
                  MentorAvailabilityDates.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['sunday'] as List<dynamic>?)
              ?.map((e) =>
                  MentorAvailabilityDates.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['tuesday'] as List<dynamic>?)
              ?.map((e) =>
                  MentorAvailabilityDates.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['saturday'] as List<dynamic>?)
              ?.map((e) =>
                  MentorAvailabilityDates.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['thursday'] as List<dynamic>?)
              ?.map((e) =>
                  MentorAvailabilityDates.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['wednesday'] as List<dynamic>?)
              ?.map((e) =>
                  MentorAvailabilityDates.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MentorAvailabilityToJson(MentorAvailability instance) =>
    <String, dynamic>{
      'friday': instance.friday,
      'monday': instance.monday,
      'sunday': instance.sunday,
      'tuesday': instance.tuesday,
      'saturday': instance.saturday,
      'thursday': instance.thursday,
      'wednesday': instance.wednesday,
    };

MentorAvailabilityDates _$MentorAvailabilityDatesFromJson(
        Map<String, dynamic> json) =>
    MentorAvailabilityDates(
      json['end_time'] as String? ?? '',
      json['start_time'] as String? ?? '',
    );

Map<String, dynamic> _$MentorAvailabilityDatesToJson(
        MentorAvailabilityDates instance) =>
    <String, dynamic>{
      'end_time': instance.end_time,
      'start_time': instance.start_time,
    };
