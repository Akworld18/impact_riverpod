import 'package:flutter/material.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';

class CustomText{

  starWithReview(){
   return Row(
      children: [
        Image.asset("assets/images/star.png",height: 14,width: 14,fit: BoxFit.contain,),
        SizedBox(width:3),
        Text("3.5",style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily:"SF-Pro-Display",
            color: Color(0xffDCA603)),),
        SizedBox(width:3),
        Text("(2,329 ratings)",style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontFamily:"SF-Pro-Display",
            color: Color(0xffADB5BD)),),
      ],
    );
  }

  userProfile({required String name,required String job,required,required Widget decorationImage}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,width: 50,
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(100)
          ),child: decorationImage,
        ),
        SizedBox(width: 9),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style: AppStyles().nameInCardStyle(fontSize:  14),),
            SizedBox(height: 4),
            Text(job,style: AppStyles().hintColorTextStyle(fontSize: 10),),
            SizedBox(height: 5),
            // Row(
            //   children: [
            //     Image.asset("assets/images/star.png",height: 14,width: 14,fit: BoxFit.contain,),
            //     SizedBox(width:3),
            //     Text("3.5",style: TextStyle(
            //         fontSize: 12,
            //         fontWeight: FontWeight.w600,
            //         fontFamily:"SF-Pro-Display",
            //         color: Color(0xffDCA603)),),
            //     SizedBox(width:3),
            //     Text("(2,329 ratings)",style: TextStyle(
            //         fontSize: 10,
            //         fontWeight: FontWeight.w400,
            //         fontFamily:"SF-Pro-Display",
            //         color: Color(0xffADB5BD)),),
            //   ],
            // ),
          ],
        )

      ],
    );
  }


}