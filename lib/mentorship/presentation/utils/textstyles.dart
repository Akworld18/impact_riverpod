import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppStyles{

  cancelColorTextStyle(){
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily:"SF-Pro-Display",
        color: cancelTextColor
    );
  }

  bookingButtonColorTextStyle(){
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily:"SF-Pro-Display",
        color: bookingButtonColor
    );
  }

  mentorTitleColorTextStyle({required double fontSize}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily:"SF-Pro-Display",
        color: mentorTitleColor
    );
  }


  sessionTitleColorTextStyle({required double fontSize}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        fontFamily:"SF-Pro-Display",
        color: mentorTitleColor
    );
  }

  whiteTextStyle({required double fontSize}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily:"SF-Pro-Display",
        color: Colors.white
    );
  }


  hintColorTextStyle({required double fontSize}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily:"SF-Pro-Display",
        color: hintTextColor
    );
  }

  hintColor500TextStyle({required double fontSize}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        fontFamily:"SF-Pro-Display",
        color: hintTextColor
    );
  }

  monthTextStyle({required double fontSize}){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily:"SF-Pro-Display",
        color: hintTextColor
    );
  }

  categoryColorStyle(){
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily:"SF-Pro-Display",
        color: categoryColor
    );
  }

  nameInCardStyle({required double fontSize}){
    return TextStyle(
        fontSize:fontSize,
        fontWeight: FontWeight.w600,
        fontFamily:"SF-Pro-Display",
        color: mentorTitleColor);
  }

  valueInCardStyle(){
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily:"SF-Pro-Display",
        color: mentorTitleColor);
  }

  sessionButtonTextStyle(){
    return TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily:"SF-Pro-Display",
        color: sessionButtonTextColor);
  }

  slotsTextStyle(){
    return TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        fontFamily:"SF-Pro-Display",
        color: bookingButtonColor);
  }

  customColorStyle({required Color color}){
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily:"SF-Pro-Display",
        color: color
    );


  }

  customColor12Style({required Color color}){
    return TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily:"SF-Pro-Display",
        color: color
    );


  }


    yearExpStyle({required FontWeight fontWeight}){
    return TextStyle(
        fontSize: 14,
        fontWeight: fontWeight,
        fontFamily:"SF-Pro-Display",
        color: yearExpColor
    );
  }

  trophyTextStyle(){
    return TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily:"SF-Pro-Display",
        color: trophyTextColor
    );
  }




}