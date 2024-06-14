import 'dart:convert';
import 'dart:developer';
import 'dart:async';


import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:impact_mentor/mentorship/domain/model/get_mentor_session_response.dart';
import 'package:impact_mentor/mentorship/domain/model/mentor_all_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';



class MentorProvider{

  Future<http.Response> invokeApi(String path, String method, Object? body,
      {required bool isHeader}) async {
    http.Response response;

    String url = "https://cdn.impacteers-club.com/api/mentor-module/v1/mentorship/$path";
    //
    // if (isAbsolutPath == true) {
    //   url = path;
    // }

    String accessToken = "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJYNEZsWkZPNkk4b0hlRFo1dVpPYUxhSW16bC1tRWRLV0pZbzBNdDh2aUVzIn0.eyJleHAiOjE3MTg5NTU4NjgsImlhdCI6MTcxODM1MTA2OCwiYXV0aF90aW1lIjoxNzE4MzQ3Nzc1LCJqdGkiOiIyNDE4MzIzNC1jNzlkLTQzYTEtYTljMS01ZTkzMTNhZmQ3YjEiLCJpc3MiOiJodHRwczovL2tleWNsb2FrLWRldi5pbXBhY3RlZXJzLWNsdWIuY29tL3JlYWxtcy9pbXBhY3RlZXJzLWlhbSIsInN1YiI6ImF1dGgwfDY1OTU0ZDE4Y2NkMzIyMGFjZmYyN2VjNyIsInR5cCI6IkJlYXJlciIsImF6cCI6ImFjY291bnQiLCJub25jZSI6Im5vbmNlNzVlOGNkMmMtZTQ2Yy00NzJmLWJlNDAtMDgzYjVkZWQ0ZTY4Iiwic2Vzc2lvbl9zdGF0ZSI6IjlkZWZmZGQ2LTk3MTUtNGU2MS04YTdiLWU1MzUzYTg5NzVhNyIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJVc2VyIl19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUiLCJzaWQiOiI5ZGVmZmRkNi05NzE1LTRlNjEtOGE3Yi1lNTM1M2E4OTc1YTciLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInByZWZlcnJlZF91c2VybmFtZSI6InByZW1rdW1hci5hcitkZXYxQHRpc3RlcHMuY28iLCJnaXZlbl9uYW1lIjoiIiwiZmFtaWx5X25hbWUiOiIiLCJlbWFpbCI6InByZW1rdW1hci5hcitkZXYxQHRpc3RlcHMuY28ifQ.sv-G4tZ6BIk-mKNQmHNlFDCKEYDHZsjc4E0w8z2O9FSznSgztUzKWj33ZY9D2W0IU7xXUwWwtmfuSG5exhT279TrpAQNk0xIaRDaxSV5dw0_S7uk0aEKd-8ItOIHpDgVExHitU0R3QKQ0lr03pJ29avvrVoTDjAw7PN7GJIwLg1LFmg0inuNESiGxyRjRld0L4qCFGwBd-ZRRD_W49JMgx7X3mYnmnb4flvGfxlmAjmX7ymV5Jc3g1rYqUz86KxUEh1pdeyH9oZXmkMUHuOQy45WCs9RlI6qGRlR1G-R5-UEQvWQy1je8TtSMB7FRDifDtdvRIDbiWFHFwNeB_uLSA";

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