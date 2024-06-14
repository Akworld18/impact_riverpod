import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:impact_mentor/mentorship/data/provider/mentor_provider.dart';
import 'package:impact_mentor/mentorship/domain/model/booking_details_model.dart';
import 'package:impact_mentor/mentorship/domain/model/booking_saved_response.dart';
import 'package:impact_mentor/mentorship/domain/model/get_mentor_session_response.dart';
import 'package:impact_mentor/mentorship/domain/model/mentor_all_response.dart';
import 'package:impact_mentor/mentorship/domain/model/saveBooking_body_model.dart';
import 'package:impact_mentor/mentorship/domain/model/session_availability.dart';
import 'package:impact_mentor/mentorship/presentation/ui/booking_confirmed.dart';
import 'package:impact_mentor/mentorship/presentation/ui/mentor_dashboard.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mentor_repository.g.dart';

@riverpod
Future<MentorSessionResponse> getSessionRequest(GetSessionRequestRef ref,String sessionId) async {
  final response = await MentorProvider().invokeApi('/mentee/session-availability?session_id=$sessionId', 'GET', {}, isHeader: true);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return MentorSessionResponse.fromJson(json);
}


@riverpod
Future<BookingDetailsResponse> getBookingDetails(GetBookingDetailsRef ref,String bookingStatus) async {
  final response = await MentorProvider().invokeApi('/booking-details', 'POST', {
    "status": bookingStatus
  }, isHeader: true);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return BookingDetailsResponse.fromJson(json);
}


@riverpod
Future saveBookingDetails(SaveBookingDetailsRef ref,SaveBookingModel bodyModel,BuildContext navigateContext,String bookingDate,String bookingTime,MentorResponseDataModel? mentorResponseDataModel) async {
  final response = await MentorProvider().invokeApi('mentee/save-booking', 'POST', {
    "mentor_user_id" : bodyModel.mentorId,
    "session_id" : bodyModel.sessionId,
    "booked_time" :bodyModel.bookingTime,
    "mentee_user_id":bodyModel.menteeId
  }, isHeader: true);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  BookingSavedResponse bookingSavedResponse = BookingSavedResponse.fromJson(json);
  if(bookingSavedResponse.status == "success"){
    Navigator.push(navigateContext, MaterialPageRoute(builder: (BuildContext context)=> BookingConfirmedScreen(mentorResponseDataModel: mentorResponseDataModel, bookingTime: bookingTime, bookingDate: bookingDate,)));
  }
  else{
    Navigator.push(navigateContext, MaterialPageRoute(builder:(BuildContext context)=> MentorDashboard() ));
  }
}


@riverpod
Future<MentorAllModel> getAllMentors(GetAllMentorsRef ref, String searchValue) async {
  final response = await MentorProvider().invokeApi('mentor/all', 'POST', {
    "search_text": searchValue
  }, isHeader: true);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return MentorAllResponse.fromJson(json).data;
}

@riverpod
Future<GetMentorSessionDataModel> getMentorSessions(
    GetMentorSessionsRef ref, String mentorId) async {
  final response = await MentorProvider().invokeApi('/mentor-sessions?mentor_id=$mentorId', 'GET', {}, isHeader: true);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return GetMentorSessionResponse.fromJson(json).data;
}