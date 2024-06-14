// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDetailsResponse _$BookingDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    BookingDetailsResponse(
      BookingData.fromJson(json['data'] as Map<String, dynamic>),
      json['status'] as String? ?? '',
    );

Map<String, dynamic> _$BookingDetailsResponseToJson(
        BookingDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

BookingData _$BookingDataFromJson(Map<String, dynamic> json) => BookingData(
      (json['responseData'] as List<dynamic>?)
              ?.map((e) =>
                  BookingResponseData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      json['message'] as String? ?? '',
    );

Map<String, dynamic> _$BookingDataToJson(BookingData instance) =>
    <String, dynamic>{
      'message': instance.message,
      'responseData': instance.responseData,
    };

BookingResponseData _$BookingResponseDataFromJson(Map<String, dynamic> json) =>
    BookingResponseData(
      json['booked_time'] as String? ?? '',
      json['booking_cancelled_by'] as String? ?? '',
      json['booking_id'] as String? ?? '',
      json['company'] as String? ?? '',
      json['current_position'] as String? ?? '',
      json['first_name'] as String? ?? '',
      json['free_session'] as bool? ?? false,
      json['gender'] as String? ?? '',
      json['intro_video_url'] as String? ?? '',
      json['is_active'] as bool? ?? false,
      json['is_booking_cancelled'] as bool? ?? false,
      json['is_mentor_approved'] as bool? ?? false,
      json['is_session_deleted'] as bool? ?? false,
      json['last_name'] as String? ?? '',
      json['linkedin_url'] as String? ?? '',
      json['location'] as String? ?? '',
      json['mentee_user_id'] as String? ?? '',
      json['mentor_user_id'] as String? ?? '',
      (json['months_of_experience'] as num?)?.toInt() ?? 0,
      (json['number_of_sessions'] as num?)?.toInt() ?? 0,
      json['personal_website'] as String? ?? '',
      json['price'] as String? ?? '',
      json['profile_picture'] as String? ?? '',
      json['public_session'] as bool? ?? false,
      json['schedule'] as String? ?? '',
      json['selling_price'] as String? ?? '',
      json['sessio_dscription'] as String? ?? '',
      (json['session_duration'] as num?)?.toInt() ?? 0,
      json['session_id'] as String? ?? '',
      json['session_name'] as String? ?? '',
      json['session_type'] as String? ?? '',
      json['story'] as String? ?? '',
      (json['years_of_experience'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BookingResponseDataToJson(
        BookingResponseData instance) =>
    <String, dynamic>{
      'booking_id': instance.booking_id,
      'mentor_user_id': instance.mentor_user_id,
      'session_id': instance.session_id,
      'booked_time': instance.booked_time,
      'mentee_user_id': instance.mentee_user_id,
      'is_mentor_approved': instance.is_mentor_approved,
      'is_booking_cancelled': instance.is_booking_cancelled,
      'booking_cancelled_by': instance.booking_cancelled_by,
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
      'intro_video_url': instance.intro_video_url,
      'story': instance.story,
      'schedule': instance.schedule,
      'is_active': instance.is_active,
      'session_name': instance.session_name,
      'sessio_dscription': instance.sessio_dscription,
      'session_duration': instance.session_duration,
      'session_type': instance.session_type,
      'number_of_sessions': instance.number_of_sessions,
      'free_session': instance.free_session,
      'price': instance.price,
      'selling_price': instance.selling_price,
      'public_session': instance.public_session,
      'is_session_deleted': instance.is_session_deleted,
    };
