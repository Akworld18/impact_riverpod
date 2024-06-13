import 'package:flutter/material.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';
import 'app_colors.dart';


class CustomBox{

  sessionButton({required double height,required double width,required GestureTapCallback? onTap,required String title}){
    return GestureDetector(
    onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: sessionButtonColor
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: width,right: width,top: height,bottom: height),
          child: Center(
            child: Text(title,style:AppStyles().sessionButtonTextStyle(),),
          ),
        ),
      ),
    );
  }

  trophyBox({required String title,required String value,required Size size}){
    return SizedBox(
      width: size.width * 45/100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: trophyBoxColor,
                borderRadius: BorderRadius.circular(4)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: Image.asset('assets/images/trophy.png',height: 22,width: 22,fit: BoxFit.contain,),),
            ),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,style: AppStyles().trophyTextStyle(),),
              SizedBox(height: 2),
              Text(value,style: AppStyles().yearExpStyle(fontWeight: FontWeight.w600),),

            ],
          )
        ],
      ),
    );
  }

  chatBox(){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: timeBorder),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18,right: 18,top: 7,bottom: 7),
        child: Center(
          child: Text('Chat',style: AppStyles().bookingButtonColorTextStyle(),),
        ),
      ),
    );
  }
}