import 'dart:convert';
import 'dart:developer';

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
