import 'dart:convert';
import 'dart:developer';
import 'dart:async';


import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:impact_mentor/mentorship/domain/model/get_mentor_session_response.dart';
import 'package:impact_mentor/mentorship/domain/model/mentor_all_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mentor_provider.g.dart';

@riverpod
Future<MentorAllModel> getAllMentors(
    GetAllMentorsRef ref, String searchValue) async {
  log(searchValue);
  log('Search Name');
  // Using package:http, we fetch a random activity from the Bored API.
  Response response = await http.post(
      body: jsonEncode({"search_text": searchValue}),
      Uri.parse(
          'https://mentorship-0j2u.onrender.com/api/v1/mentorship/mentor/all'));

  final json = jsonDecode(response.body) as Map<String, dynamic>;
  // Finally, we convert the Map into an Activity instance.
  return MentorAllResponse.fromJson(json).data;
}

@riverpod
Future<GetMentorSessionDataModel> getMentorSessions(
    GetMentorSessionsRef ref, String mentorId) async {
  // Using package:http, we fetch a random activity from the Bored API.
  Response response = await http.get(Uri.parse(
      'https://mentorship-0j2u.onrender.com/api/v1/mentorship/mentor-sessions?mentor_id=$mentorId'));

  final json = jsonDecode(response.body) as Map<String, dynamic>;
  // Finally, we convert the Map into an Activity instance.
  return GetMentorSessionResponse.fromJson(json).data;
}



class MentorProvider{

  Future<http.Response> invokeApi(String path, String method, Object? body,
      {required bool isHeader}) async {
    http.Response response;

    String url = "https://mentorship-0j2u.onrender.com/api/v1/mentorship/$path";
    //
    // if (isAbsolutPath == true) {
    //   url = path;
    // }

    String accessToken = "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJYNEZsWkZPNkk4b0hlRFo1dVpPYUxhSW16bC1tRWRLV0pZbzBNdDh2aUVzIn0.eyJleHAiOjE3MTgzMjMzNzQsImlhdCI6MTcxODI4NzM3NCwiYXV0aF90aW1lIjoxNzE4Mjg3Mzc0LCJqdGkiOiI1ZGIyOTA3My04MDEzLTQ5NjYtOGRlZi0yZmEyYzAyMTc5YTgiLCJpc3MiOiJodHRwczovL2tleWNsb2FrLWRldi5pbXBhY3RlZXJzLWNsdWIuY29tL3JlYWxtcy9pbXBhY3RlZXJzLWlhbSIsInN1YiI6IjFhMjRlYjM5LWRlZTEtNGYxZi05ODE3LTg5YmJiZmE2ZmM0NiIsInR5cCI6IkJlYXJlciIsImF6cCI6ImFjY291bnQiLCJub25jZSI6Im5vbmNlMTZkNjhkMDctOTI0NC00ODg0LTkzODQtZTQ5MGJiMTc3MzE4Iiwic2Vzc2lvbl9zdGF0ZSI6IjdhNTE0NmJkLWQ1MGYtNDY0Ny04ODc5LWIyMTM4MjgzZDBjMyIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJkZWZhdWx0LXJvbGVzLWltcGFjdGVlcnMtaWFtIiwiVXNlciJdfSwic2NvcGUiOiJlbWFpbCIsInNpZCI6IjdhNTE0NmJkLWQ1MGYtNDY0Ny04ODc5LWIyMTM4MjgzZDBjMyIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZW1haWwiOiJwcmVta3VtYXIuYXI5OUBnbWFpbC5jb20ifQ.P5zlOe8ys0xfhBXY3N3VGV_CoAbGXQLbSEMbMgdHTmGGLTf1z61hxE34uuGIagMME9Cj3Se4uoOTL9RS-fMkYebYsx9vv9whl3aQHTcs2xYwieWwFl7h0Gq_FOo_dT2oN4G2y3zwrgOZvzVTYPEb2es9TbcjKOAsBOJviaESr6jZ4H7-NXLOmxR3DPUM8lh9orWYIFIy-I_SouwauD0L5KeBPXl5rQel6KGfVFgoP2eEHokgBjoSOUCgF687vyZwmK2u-pDPuq2-GthgAEJJ1IgFNnGR_xPUXW6ZWP9YOQ6WeSUet_DlYwvEv7uPUfmIDfAdiPo0vn4BZwMT1eJtOw";

    // String? accessToken;
    // try {
    //   FlutterSecureStorage flutterSecureStorage =
    //   locater<FlutterSecureStorage>();
    //   final login_response =
    //   await sharedPreferences.getString('login_response');
    //
    //   accessToken = LoginResponseModel
    //       .fromJson(jsonDecode(login_response!))
    //       .token!
    //       .accessToken;
    // } catch (e) {
    //   throw AuthException(message: e.toString(), code: 999);
    // }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $accessToken"
    };

    try {
      switch (method) {
        case "POST":
          if(isHeader){
            response = await http
                .post(Uri.parse(url), headers: headers, body: jsonEncode(body))
                .timeout(Duration(seconds: 10));
          }
          else{
            response = await http
                .post(Uri.parse(url), body: jsonEncode(body))
                .timeout(Duration(seconds: 10));
          }

          break;
        case "PUT":
          response = await http.put(Uri.parse(url),
              headers: headers, body: jsonEncode(body));
          break;
        case "DELETE":
          response = await http.delete(Uri.parse(url), headers: headers);
          break;
        case "PATCH":
          response = await http.patch(Uri.parse(url),
              headers: headers, body: jsonEncode(body));
          break;
        default:
          if(isHeader){
            response = await http
                .get(Uri.parse(url), headers: headers)
                .timeout(const Duration(seconds: 7));
          }
          else{
            response = await http
                .get(Uri.parse(url))
                .timeout(const Duration(seconds: 7));
          }

      }
      if (!url.contains('alumni') && !url.contains('printer/preview')) {
        // developer.log(
        //   "api call: $url : $method :${response
        //       .statusCode} : ${body} : ${response.body} ",
        // );
      }

      if (response.statusCode >= 300) {
        throw ImpacteersApiException(
            message: _decodeBodyBytes(response),
            statusCode: response.statusCode);
      }
    } on TimeoutException catch (e) {
      throw ImpacteersApiException(
          message:
          'There is a problem connecting to our servers.Please try again',
          statusCode: 001);
    }

    return response;
  }

  String _decodeBodyBytes(http.Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(utf8.decode(response.bodyBytes))['message'] ??
          jsonDecode(utf8.decode(response.bodyBytes))['error'];
    } else {
      return response.body;
    }
  }
}


class ImpacteersApiException {
  String message;
  int statusCode;

  ImpacteersApiException({required this.message,required this.statusCode});
}