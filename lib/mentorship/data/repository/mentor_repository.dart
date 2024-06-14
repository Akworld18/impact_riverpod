import 'dart:convert';
import 'package:impact_mentor/mentorship/data/provider/mentor_provider.dart';
import 'package:impact_mentor/mentorship/domain/model/booking_details_model.dart';
import 'package:impact_mentor/mentorship/domain/model/booking_saved_response.dart';
import 'package:impact_mentor/mentorship/domain/model/saveBooking_body_model.dart';
import 'package:impact_mentor/mentorship/domain/model/session_availability.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mentor_repository.g.dart';

@riverpod
Future<MentorSessionResponse> getSessionRequest(GetSessionRequestRef ref,String mentorId) async {
  final response = await MentorProvider().invokeApi('/mentee/session-availability?session_id=$mentorId', 'GET', {}, isHeader: false);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  // String data= jsonEncode({
  //   "status": "success",
  //   "data": {
  //     "message": "Datas retrieved successfully.",
  //     "responseData": {
  //       "availability": {
  //         "friday": [],
  //         "monday": [
  //           {
  //             "end_time": "04:30 PM",
  //             "start_time": "12:30 PM"
  //           }
  //         ],
  //         "sunday": [
  //           {
  //             "end_time": "02:33 PM",
  //             "start_time": "12:34 PM"
  //           }
  //         ],
  //         "tuesday": [],
  //         "saturday": [],
  //         "thursday": [],
  //         "wednesday": []
  //       },
  //       "booked_times": [],
  //       "server_time": "2024-06-13T12:27:43.605Z"
  //     }
  //   }
  // });
  return MentorSessionResponse.fromJson(json);
}


@riverpod
Future<BookingDetailsResponse> getBookingDetails(GetBookingDetailsRef ref,String bookingStatus) async {
  // final response = await MentorProvider().invokeApi('/mentee/session-availability?session_id=$mentorId', 'GET', {}, isHeader: false);
  // final json = jsonDecode(response.body) as Map<String, dynamic>;
  String data = "";
  if(bookingStatus == "upcoming"){
    data= jsonEncode({
      "status": "success",
      "data": {
        "message": "Data retrieved successfully.",
        "responseData": [
          {
            "booking_id": "2fec04e4-a313-4851-8cbf-e407672ca666",
            "mentor_user_id": "37f4e330-b573-4357-8db8-9c5d116a4b31",
            "session_id": "8319bf55-3040-4d3e-b671-17eadf3be79c",
            "booked_time": "2024-06-02T01:00:00.000Z",
            "mentee_user_id": "8689189c-b4e1-444c-8a12-b927bde71c0b",
            "is_mentor_approved": true,
            "is_booking_cancelled": false,
            "booking_cancelled_by": null,
            "profile_picture": "",
            "first_name": "John",
            "last_name": "Doe",
            "current_position": "Software Engineer",
            "company": "Tech Company",
            "years_of_experience": 5,
            "months_of_experience": 6,
            "location": "New York, USA",
            "linkedin_url": "https://linkedin.com/in/johndoe",
            "personal_website": "http://www.johndoe.com",
            "gender": "Male",
            "languages": [
              "Tamil",
              "English",
              "Malayalam",
              "French",
              "German"
            ],
            "field_of_expertise": [
              1,
              2
            ],
            "relevant_expertise": [
              3,
              4
            ],
            "intro_video_url": "youtube.com",
            "story": "lorem jfjd bjghgfd hgahfga khghakdfhjdadfnmb jhgadfhgfdahf jhgadhfg",
            "schedule": "free_at_certain_times",
            "is_active": true,
            "session_emoji": "",
            "session_name": "How to build resume",
            "sessio_dscription": "",
            "session_duration": 30,
            "session_type": "recurring",
            "number_of_sessions": 3,
            "occurrence": "",
            "free_session": true,
            "price": "120.20",
            "selling_price": "150.00",
            "public_session": false,
            "is_session_deleted": false
          }
        ]
      }
    });
  }
  else if(bookingStatus == "completed"){
    data= jsonEncode({
      "status": "success",
      "data": {
        "message": "Datas retrieved successfully.",
        "responseData": [
          {
            "booking_id": "2fec04e4-a313-4851-8cbf-e407672ca666",
            "mentor_user_id": "37f4e330-b573-4357-8db8-9c5d116a4b31",
            "session_id": "8319bf55-3040-4d3e-b671-17eadf3be79c",
            "booked_time": "2024-06-02T01:00:00.000Z",
            "mentee_user_id": "8689189c-b4e1-444c-8a12-b927bde71c0b",
            "is_mentor_approved": true,
            "is_booking_cancelled": false,
            "booking_cancelled_by": null,
            "profile_picture": "",
            "first_name": "John",
            "last_name": "Doe",
            "current_position": "Software Engineer",
            "company": "Tech Company",
            "years_of_experience": 5,
            "months_of_experience": 6,
            "location": "New York, USA",
            "linkedin_url": "https://linkedin.com/in/johndoe",
            "personal_website": "http://www.johndoe.com",
            "gender": "Male",
            "languages": [
              "Tamil",
              "English",
              "Malayalam",
              "French",
              "German"
            ],
            "field_of_expertise": [
              1,
              2
            ],
            "relevant_expertise": [
              3,
              4
            ],
            "intro_video_url": "youtube.com",
            "story": "lorem jfjd bjghgfd hgahfga khghakdfhjdadfnmb jhgadfhgfdahf jhgadhfg",
            "schedule": "free_at_certain_times",
            "availability": {
              "friday": [],
              "monday": [
                {
                  "end_time": "07:50 AM",
                  "start_time": "07:00 AM"
                },
                {
                  "end_time": "07:50 PM",
                  "start_time": "07:00 PM"
                }
              ],
              "sunday": [],
              "tuesday": [
                {
                  "end_time": "09:45 AM",
                  "start_time": "09:00 AM"
                }
              ],
              "saturday": [],
              "thursday": [
                {
                  "end_time": "09:00 AM",
                  "start_time": "08:15 AM"
                }
              ],
              "wednesday": [
                {
                  "end_time": "07:15 AM",
                  "start_time": "06:30 AM"
                }
              ]
            },
            "is_active": true,
            "session_emoji": "",
            "session_name": "How to develop Skills",
            "sessio_dscription": "",
            "session_duration": 30,
            "session_type": "recurring",
            "number_of_sessions": 3,
            "occurrence": "",
            "free_session": true,
            "price": "120.20",
            "selling_price": "150.00",
            "public_session": false,
            "is_session_deleted": false
          }
        ]
      }
    });
  }
  else{
    data= jsonEncode({
      "status": "success",
      "data": {
        "message": "Datas retrieved successfully.",
        "responseData": [
          {
            "booking_id": "2fec04e4-a313-4851-8cbf-e407672ca666",
            "mentor_user_id": "37f4e330-b573-4357-8db8-9c5d116a4b31",
            "session_id": "8319bf55-3040-4d3e-b671-17eadf3be79c",
            "booked_time": "2024-06-02T01:00:00.000Z",
            "mentee_user_id": "8689189c-b4e1-444c-8a12-b927bde71c0b",
            "is_mentor_approved": false,
            "is_booking_cancelled": false,
            "booking_cancelled_by": null,
            "profile_picture": "",
            "first_name": "John",
            "last_name": "Doe",
            "current_position": "Software Engineer",
            "company": "Tech Company",
            "years_of_experience": 5,
            "months_of_experience": 6,
            "location": "New York, USA",
            "linkedin_url": "https://linkedin.com/in/johndoe",
            "personal_website": "http://www.johndoe.com",
            "gender": "Male",
            "languages": [
              "Tamil",
              "English",
              "Malayalam",
              "French",
              "German"
            ],
            "field_of_expertise": [
              1,
              2
            ],
            "relevant_expertise": [
              3,
              4
            ],
            "intro_video_url": "youtube.com",
            "story": "lorem jfjd bjghgfd hgahfga khghakdfhjdadfnmb jhgadfhgfdahf jhgadhfg",
            "schedule": "free_at_certain_times",
            "availability": {
              "friday": [],
              "monday": [
                {
                  "end_time": "07:50 AM",
                  "start_time": "07:00 AM"
                },
                {
                  "end_time": "07:50 PM",
                  "start_time": "07:00 PM"
                }
              ],
              "sunday": [],
              "tuesday": [
                {
                  "end_time": "09:45 AM",
                  "start_time": "09:00 AM"
                }
              ],
              "saturday": [],
              "thursday": [
                {
                  "end_time": "09:00 AM",
                  "start_time": "08:15 AM"
                }
              ],
              "wednesday": [
                {
                  "end_time": "07:15 AM",
                  "start_time": "06:30 AM"
                }
              ]
            },
            "is_active": true,
            "session_emoji": "",
            "session_name": "How to search Jobs",
            "sessio_dscription": "",
            "session_duration": 30,
            "session_type": "recurring",
            "number_of_sessions": 3,
            "occurrence": "",
            "free_session": true,
            "price": "120.20",
            "selling_price": "150.00",
            "public_session": false,
            "is_session_deleted": false
          }
        ]
      }
    });
  }
  final json = jsonDecode(data) as Map<String, dynamic>;
  return BookingDetailsResponse.fromJson(json);
}


@riverpod
Future<BookingSavedResponse> saveBookingDetails(SaveBookingDetailsRef ref,SaveBookingModel bodyModel) async {
  final response = await MentorProvider().invokeApi('mentee/save-booking', 'POST', {
    "mentor_user_id" : bodyModel.mentorId,
    "session_id" : bodyModel.sessionId,
    "booked_time" :bodyModel.bookingTime,
    "mentee_user_id":bodyModel.menteeId
  }, isHeader: true);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return BookingSavedResponse.fromJson(json);
}
