import 'package:flutter/material.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';
import 'package:shimmer/shimmer.dart';

import 'app_colors.dart';
import 'customBox.dart';

class CustomBottom{
  bottomRow({required double width,required String buttonTitle,required String title,required String value,required GestureTapCallback? onTap,}){
    return  Container(
      height: 70,
      width: double.infinity,color: Color(0xff191C1F),
      child: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12),
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: AppStyles().customColorStyle(color: profileBottom),),
                Text(value,style: AppStyles().nameInCardStyle(fontSize: 14),)
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 14,bottom: 14),
              child:CustomBox().sessionButton(height: 10, width: width, onTap:onTap,title: buttonTitle),
            )
          ],
        ) ,
      ),);
  }



}

class MentorLoader extends StatelessWidget {
  const MentorLoader({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.white10,
      highlightColor: Colors.white30,
      child: Column(
        children: [
          for(int i=0;i<2;i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              color: Colors.white10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.white10,
                      highlightColor: Colors.white,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        width: size.width * .30,
                        height: 16.0,
                        margin: const EdgeInsets.only(bottom: 8.0),
                      ),
                    ),
                    Shimmer.fromColors(
                        baseColor: Colors.white10,
                        highlightColor: Colors.white,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.white,
                          ),
                          width: size.width * .80,
                          height: 14.0,
                          margin: const EdgeInsets.only(bottom: 8.0),
                        )),
                    Shimmer.fromColors(
                      baseColor: Colors.white10,
                      highlightColor: Colors.white,
                      child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          height: 150,
                          margin: const EdgeInsets.only(bottom: 8.0)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}