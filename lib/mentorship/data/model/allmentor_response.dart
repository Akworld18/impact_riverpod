class AllMentorResponse {
  String? status;
  Data? data;

  AllMentorResponse({this.status, this.data});

  AllMentorResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? message;
  List<ResponseData>? responseData;

  Data({this.message, this.responseData});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['responseData'] != null) {
      responseData = <ResponseData>[];
      json['responseData'].forEach((v) {
        responseData!.add(new ResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.responseData != null) {
      data['responseData'] = this.responseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseData {
  String? mentorUserId;
  String? profilePicture;
  String? firstName;
  String? lastName;
  String? currentPosition;
  String? company;
  int? yearsOfExperience;
  int? monthsOfExperience;
  String? location;
  String? linkedinUrl;
  String? personalWebsite;
  String? gender;
  List<String>? languages;
  List<int>? fieldOfExpertise;
  List<int>? relevantExpertise;
  String? introVideoUrl;
  String? story;
  String? schedule;
  bool? isActive;

  ResponseData(
      {this.mentorUserId,
        this.profilePicture,
        this.firstName,
        this.lastName,
        this.currentPosition,
        this.company,
        this.yearsOfExperience,
        this.monthsOfExperience,
        this.location,
        this.linkedinUrl,
        this.personalWebsite,
        this.gender,
        this.languages,
        this.fieldOfExpertise,
        this.relevantExpertise,
        this.introVideoUrl,
        this.story,
        this.schedule,
        this.isActive});

  ResponseData.fromJson(Map<String, dynamic> json) {
    mentorUserId = json['mentor_user_id'];
    profilePicture = json['profile_picture'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    currentPosition = json['current_position'];
    company = json['company'];
    yearsOfExperience = json['years_of_experience'];
    monthsOfExperience = json['months_of_experience'];
    location = json['location'];
    linkedinUrl = json['linkedin_url'];
    personalWebsite = json['personal_website'];
    gender = json['gender'];
    languages = json['languages'].cast<String>();
    fieldOfExpertise = json['field_of_expertise'].cast<int>();
    relevantExpertise = json['relevant_expertise'].cast<int>();
    introVideoUrl = json['intro_video_url'];
    story = json['story'];
    schedule = json['schedule'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mentor_user_id'] = this.mentorUserId;
    data['profile_picture'] = this.profilePicture;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['current_position'] = this.currentPosition;
    data['company'] = this.company;
    data['years_of_experience'] = this.yearsOfExperience;
    data['months_of_experience'] = this.monthsOfExperience;
    data['location'] = this.location;
    data['linkedin_url'] = this.linkedinUrl;
    data['personal_website'] = this.personalWebsite;
    data['gender'] = this.gender;
    data['languages'] = this.languages;
    data['field_of_expertise'] = this.fieldOfExpertise;
    data['relevant_expertise'] = this.relevantExpertise;
    data['intro_video_url'] = this.introVideoUrl;
    data['story'] = this.story;
    data['schedule'] = this.schedule;
    data['is_active'] = this.isActive;
    return data;
  }
}

