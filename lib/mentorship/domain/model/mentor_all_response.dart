import 'package:json_annotation/json_annotation.dart';

part 'mentor_all_response.g.dart';

@JsonSerializable()
class MentorAllResponse {
  @JsonKey(defaultValue: '')
  final String? status;
  final MentorAllModel data;

  MentorAllResponse(this.status, this.data);

  factory MentorAllResponse.fromJson(Map<String, dynamic> json) =>
      _$MentorAllResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MentorAllResponseToJson(this);
}

@JsonSerializable()
class MentorAllModel {
  @JsonKey(defaultValue: '')
  final String? message;
  final List<MentorResponseDataModel> responseData;

  MentorAllModel(this.message, this.responseData);

  factory MentorAllModel.fromJson(Map<String, dynamic> json) =>
      _$MentorAllModelFromJson(json);
  Map<String, dynamic> toJson() => _$MentorAllModelToJson(this);
}

@JsonSerializable()
class MentorResponseDataModel {
  @JsonKey(defaultValue: '')
  String? mentor_user_id;
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
  @JsonKey(defaultValue: [])
  List<int>? field_of_expertise;
  @JsonKey(defaultValue: [])
  List<int>? relevant_expertise;
  @JsonKey(defaultValue: '')
  String? intro_video_url;
  @JsonKey(defaultValue: '')
  String? story;
  @JsonKey(defaultValue: '')
  String? schedule;
  @JsonKey(defaultValue: false)
  bool? is_active;

  factory MentorResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$MentorResponseDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$MentorResponseDataModelToJson(this);

  MentorResponseDataModel(
      this.mentor_user_id,
      this.profile_picture,
      this.first_name,
      this.last_name,
      this.current_position,
      this.company,
      this.years_of_experience,
      this.months_of_experience,
      this.location,
      this.linkedin_url,
      this.personal_website,
      this.gender,
      this.field_of_expertise,
      this.relevant_expertise,
      this.intro_video_url,
      this.story,
      this.schedule,
      this.is_active);
}
