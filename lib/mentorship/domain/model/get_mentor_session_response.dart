import 'package:json_annotation/json_annotation.dart';

part 'get_mentor_session_response.g.dart';

@JsonSerializable()
class GetMentorSessionResponse {
  @JsonKey(defaultValue: '')
  String? status;
  final GetMentorSessionDataModel data;

  GetMentorSessionResponse(this.status, this.data);

  factory GetMentorSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMentorSessionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetMentorSessionResponseToJson(this);
}

@JsonSerializable()
class GetMentorSessionDataModel {
  @JsonKey(defaultValue: '')
  String? message;
  List<GetMentorSessionResponseDataModel> responseData;

  GetMentorSessionDataModel(this.message, this.responseData);

  factory GetMentorSessionDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetMentorSessionDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetMentorSessionDataModelToJson(this);
}

@JsonSerializable()
class GetMentorSessionResponseDataModel {
  @JsonKey(defaultValue: '')
  String? session_id;
  @JsonKey(defaultValue: '')
  String? mentor_user_id;
  @JsonKey(defaultValue: '')
  String? session_emoji;
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
  @JsonKey(defaultValue: '')
  String? occurrence;
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

  GetMentorSessionResponseDataModel(
      this.session_id,
      this.mentor_user_id,
      this.session_emoji,
      this.session_name,
      this.sessio_dscription,
      this.session_duration,
      this.session_type,
      this.number_of_sessions,
      this.occurrence,
      this.free_session,
      this.price,
      this.selling_price,
      this.public_session,
      this.is_session_deleted);

  factory GetMentorSessionResponseDataModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetMentorSessionResponseDataModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetMentorSessionResponseDataModelToJson(this);
}
