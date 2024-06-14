// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_all_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorAllResponse _$MentorAllResponseFromJson(Map<String, dynamic> json) =>
    MentorAllResponse(
      json['status'] as String? ?? '',
      MentorAllModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorAllResponseToJson(MentorAllResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

MentorAllModel _$MentorAllModelFromJson(Map<String, dynamic> json) =>
    MentorAllModel(
      json['message'] as String? ?? '',
      (json['responseData'] as List<dynamic>)
          .map((e) =>
              MentorResponseDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MentorAllModelToJson(MentorAllModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'responseData': instance.responseData,
    };

MentorResponseDataModel _$MentorResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    MentorResponseDataModel(
      json['mentor_user_id'] as String? ?? '',
      json['profile_picture'] as String? ?? '',
      json['first_name'] as String? ?? '',
      json['last_name'] as String? ?? '',
      json['current_position'] as String? ?? '',
      json['company'] as String? ?? '',
      (json['years_of_experience'] as num?)?.toInt() ?? 0,
      (json['months_of_experience'] as num?)?.toInt() ?? 0,
      json['location'] as String? ?? '',
      json['linkedin_url'] as String? ?? '',
      json['personal_website'] as String? ?? '',
      json['gender'] as String? ?? '',
      (json['field_of_expertise'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      (json['relevant_expertise'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      json['intro_video_url'] as String? ?? '',
      json['story'] as String? ?? '',
      json['schedule'] as String? ?? '',
      json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$MentorResponseDataModelToJson(
        MentorResponseDataModel instance) =>
    <String, dynamic>{
      'mentor_user_id': instance.mentor_user_id,
      'profile_picture': instance.profile_picture,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'current_position': instance.current_position,
      'company': instance.company,
      'years_of_experience': instance.years_of_experience,
      'months_of_experience': instance.months_of_experience,
      'location': instance.location,
      'linkedin_url': instance.linkedin_url,
      'personal_website': instance.personal_website,
      'gender': instance.gender,
      'field_of_expertise': instance.field_of_expertise,
      'relevant_expertise': instance.relevant_expertise,
      'intro_video_url': instance.intro_video_url,
      'story': instance.story,
      'schedule': instance.schedule,
      'is_active': instance.is_active,
    };
