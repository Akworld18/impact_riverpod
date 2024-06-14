import 'package:json_annotation/json_annotation.dart';
part 'session_availability.g.dart';


@JsonSerializable()
class MentorSessionResponse {
  @JsonKey(
      defaultValue:
      ''
  )
  String? status;
  final MentorSessionDataModel data;
  MentorSessionResponse(this.status, this.data);
  factory MentorSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$MentorSessionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MentorSessionResponseToJson(this);
}

@JsonSerializable()
class MentorSessionDataModel {
  @JsonKey(
      defaultValue:
      ''
  )
  String? message;
  final MentorResponseData responseData;
  MentorSessionDataModel(this.message, this.responseData);
  factory MentorSessionDataModel.fromJson(Map<String, dynamic> json) =>
      _$MentorSessionDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$MentorSessionDataModelToJson(this);
}

@JsonSerializable()
class MentorResponseData {
  final MentorAvailability availability;
  @JsonKey(
      defaultValue:
      ''
  )
  String? server_time;
  MentorResponseData(this.availability, this.server_time);
  factory MentorResponseData.fromJson(Map<String, dynamic> json) =>
      _$MentorResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$MentorResponseDataToJson(this);
}

@JsonSerializable()
class MentorAvailability {
  @JsonKey(
      defaultValue: []
  )
  List<MentorAvailabilityDates>? friday;
  @JsonKey(
      defaultValue: []
  )
  List<MentorAvailabilityDates>? monday;
  @JsonKey(
      defaultValue: []
  )
  List<MentorAvailabilityDates>? sunday;
  @JsonKey(
      defaultValue: []
  )
  List<MentorAvailabilityDates>? tuesday;
  @JsonKey(
      defaultValue: []
  )
  List<MentorAvailabilityDates>? saturday;
  @JsonKey(
      defaultValue: []
  )
  List<MentorAvailabilityDates>? thursday;
  @JsonKey(
      defaultValue: []
  )
  List<MentorAvailabilityDates>? wednesday;
  factory MentorAvailability.fromJson(Map<String, dynamic> json) =>
      _$MentorAvailabilityFromJson(json);
  Map<String, dynamic> toJson() => _$MentorAvailabilityToJson(this);
  MentorAvailability(this.friday, this.monday, this.sunday, this.tuesday,
      this.saturday, this.thursday, this.wednesday);
}

@JsonSerializable()
class MentorAvailabilityDates {
  @JsonKey(
      defaultValue:
      ''
  )
  String? end_time;
  @JsonKey(
      defaultValue:
      ''
  )
  String? start_time;
  factory MentorAvailabilityDates.fromJson(Map<String, dynamic> json) =>
      _$MentorAvailabilityDatesFromJson(json);
  Map<String, dynamic> toJson() => _$MentorAvailabilityDatesToJson(this);
  MentorAvailabilityDates(this.end_time, this.start_time);
}