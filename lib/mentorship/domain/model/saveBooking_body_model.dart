import 'package:flutter/material.dart';

class SaveBookingModel{
  String mentorId;
  String sessionId;
  String menteeId;
  String bookingTime;

  SaveBookingModel({required this.bookingTime,required this.mentorId,required this.menteeId,required this.sessionId});
}