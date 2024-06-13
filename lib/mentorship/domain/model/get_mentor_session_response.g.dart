// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_mentor_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMentorSessionResponse _$GetMentorSessionResponseFromJson(
        Map<String, dynamic> json) =>
    GetMentorSessionResponse(
      json['status'] as String? ?? '',
      GetMentorSessionDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMentorSessionResponseToJson(
        GetMentorSessionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

GetMentorSessionDataModel _$GetMentorSessionDataModelFromJson(
        Map<String, dynamic> json) =>
    GetMentorSessionDataModel(
      json['message'] as String? ?? '',
      (json['responseData'] as List<dynamic>)
          .map((e) => GetMentorSessionResponseDataModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMentorSessionDataModelToJson(
        GetMentorSessionDataModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'responseData': instance.responseData,
    };

GetMentorSessionResponseDataModel _$GetMentorSessionResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetMentorSessionResponseDataModel(
      json['session_id'] as String? ?? '',
      json['mentor_user_id'] as String? ?? '',
      json['session_emoji'] as String? ?? '',
      json['session_name'] as String? ?? '',
      json['sessio_dscription'] as String? ?? '',
      (json['session_duration'] as num?)?.toInt() ?? 0,
      json['session_type'] as String? ?? '',
      (json['number_of_sessions'] as num?)?.toInt() ?? 0,
      json['occurrence'] as String? ?? '',
      json['free_session'] as bool? ?? false,
      json['price'] as String? ?? '',
      json['selling_price'] as String? ?? '',
      json['public_session'] as bool? ?? false,
      json['is_session_deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$GetMentorSessionResponseDataModelToJson(
        GetMentorSessionResponseDataModel instance) =>
    <String, dynamic>{
      'session_id': instance.session_id,
      'mentor_user_id': instance.mentor_user_id,
      'session_emoji': instance.session_emoji,
      'session_name': instance.session_name,
      'sessio_dscription': instance.sessio_dscription,
      'session_duration': instance.session_duration,
      'session_type': instance.session_type,
      'number_of_sessions': instance.number_of_sessions,
      'occurrence': instance.occurrence,
      'free_session': instance.free_session,
      'price': instance.price,
      'selling_price': instance.selling_price,
      'public_session': instance.public_session,
      'is_session_deleted': instance.is_session_deleted,
    };
