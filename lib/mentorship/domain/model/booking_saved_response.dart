import 'package:json_annotation/json_annotation.dart';
part 'booking_saved_response.g.dart';

@JsonSerializable()
class BookingSavedResponse{
  @JsonKey(defaultValue: '')
  String status;
  final BookingSavedData data;
  BookingSavedResponse(this.data,this.status);
  factory BookingSavedResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingSavedResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookingSavedResponseToJson(this);
}

@JsonSerializable()
class BookingSavedData{
  @JsonKey(defaultValue: '')
  String message;
  BookingSavedData(this.message);
  factory BookingSavedData.fromJson(Map<String, dynamic> json) =>
      _$BookingSavedDataFromJson(json);
  Map<String, dynamic> toJson() => _$BookingSavedDataToJson(this);
}