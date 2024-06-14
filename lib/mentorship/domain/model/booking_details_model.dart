import 'package:json_annotation/json_annotation.dart';

part 'booking_details_model.g.dart';


@JsonSerializable()
class BookingDetailsResponse{
  @JsonKey(defaultValue: '')
  String? status;
    final BookingData data;
  BookingDetailsResponse(this.data,this.status);
  factory BookingDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDetailsResponseToJson(this);
}

@JsonSerializable()
class BookingData{
  @JsonKey(defaultValue: '')
  String? message;
  @JsonKey(defaultValue: [])
  List<BookingResponseData> responseData;
  BookingData(this.responseData,this.message);
  factory BookingData.fromJson(Map<String, dynamic> json) =>
      _$BookingDataFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDataToJson(this);
}

@JsonSerializable()
class BookingResponseData{
  @JsonKey(defaultValue: '')
   String? booking_id;
  @JsonKey(defaultValue: '')
   String? mentor_user_id;
  @JsonKey(defaultValue: '')
   String? session_id;
  @JsonKey(defaultValue: '')
   String? booked_time;
  @JsonKey(defaultValue: '')
   String?  mentee_user_id;
  @JsonKey(defaultValue: false)
   bool? is_mentor_approved;
  @JsonKey(defaultValue: false)
   bool? is_booking_cancelled;
  @JsonKey(defaultValue: '')
   String? booking_cancelled_by;
  @JsonKey(defaultValue: '')
   String? profile_picture;
  @JsonKey(defaultValue: '')
   String? first_name;
  @JsonKey(defaultValue: '')
   String? last_name;
  @JsonKey(defaultValue: '')
   String? current_position;
  @JsonKey(defaultValue: '')
   String? company;
  @JsonKey(defaultValue: 0)
   int? years_of_experience;
  @JsonKey(defaultValue: 0)
   int? months_of_experience;
  @JsonKey(defaultValue: '')
   String? location;
  @JsonKey(defaultValue: '')
   String? linkedin_url;
  @JsonKey(defaultValue: '')
   String? personal_website;
  @JsonKey(defaultValue: '')
   String? gender;
  @JsonKey(defaultValue: '')
   String? intro_video_url;
  @JsonKey(defaultValue: '')
   String? story;
  @JsonKey(defaultValue: '')
   String? schedule;
  @JsonKey(defaultValue: false)
   bool? is_active;
  @JsonKey(defaultValue: '')
   String? session_name;
  @JsonKey(defaultValue: '')
   String? sessio_dscription;
  @JsonKey(defaultValue: 0)
   int? session_duration;
  @JsonKey(defaultValue: '')
   String? session_type;
  @JsonKey(defaultValue: 0)
   int? number_of_sessions;
  @JsonKey(defaultValue: false)
   bool? free_session;
  @JsonKey(defaultValue: '')
   String? price;
  @JsonKey(defaultValue: '')
   String? selling_price;
  @JsonKey(defaultValue: false)
   bool? public_session;
  @JsonKey(defaultValue: false)
   bool? is_session_deleted;

  BookingResponseData(this.booked_time,
      this.booking_cancelled_by,
      this.booking_id,
      this.company,
      this.current_position,
      this.first_name,
      this.free_session,
      this.gender,
      this.intro_video_url,
      this.is_active,
      this.is_booking_cancelled,
      this.is_mentor_approved,
      this.is_session_deleted,
      this.last_name,
      this.linkedin_url,
      this.location,
      this.mentee_user_id,
      this.mentor_user_id,
      this.months_of_experience,
      this.number_of_sessions,
      this.personal_website,
      this.price,
      this.profile_picture,
      this.public_session,
      this.schedule,
      this.selling_price,
      this.sessio_dscription,
      this.session_duration,
      this.session_id,
      this.session_name,
      this.session_type,
      this.story,
      this.years_of_experience
      );

  factory BookingResponseData.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$BookingResponseDataToJson(this);
}