
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:impact_mentor/mentorship/presentation/utils/app_colors.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_bottom.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_text.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';


class BookSession extends StatefulWidget {
  const BookSession({super.key});

  @override
  State<BookSession> createState() => _BookSessionState();
}

class _BookSessionState extends State<BookSession> {
  int selectIndex = 0;
  int selectTime = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.close,color: Colors.white,size: 32,),
        title: Text("Book Session",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily:"SF-Pro-Display",
            color: Color(0xffDEE2E6)
        ),),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 19,top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Session duration",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  Text("30 Mins",style: AppStyles().mentorTitleColorTextStyle(fontSize: 14),),
                  SizedBox(height: 25),
                  Text("About",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  Text("Resume & Portfolio review",style: AppStyles().mentorTitleColorTextStyle(fontSize: 14),),
                  SizedBox(height: 20),
                  CustomText().userProfile(),
                  SizedBox(height: 25),
                  Text("Next available session",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  SizedBox(height: 17),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for(int i=0;i<6;i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectIndex=i;
                              });
                            },
                            child:Container(
                              height: 100,
                              width: size.width *24/100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(color:selectIndex==i?bookingButtonColor:availableSessionBorder),
                                color: searchButtonBackground
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("WED",style: AppStyles().hintColorTextStyle(fontSize: 10),),
                                  Text("30 May",style: AppStyles().monthTextStyle(fontSize: 14),),
                                  Text("2 slots",style: AppStyles().slotsTextStyle(),),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Text("Available time slots",style: AppStyles().customColorStyle(color: hintTextColor.withOpacity(0.7)),),
                  Text("In your local timezone (Asia/Calcutta)",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,top: 17),
                    child: Row(
                      children: [
                        Flexible(child: Wrap(
                          children: [
                            for(int i=0;i<5;i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 10,bottom: 16),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      selectTime=i;
                                    });
                                  },
                                  child: Container(
                                    height:40 ,
                                    width: size.width * 28/100,
                                    decoration: BoxDecoration(
                                      color: selectTime==i?bookingButtonColor:Colors.transparent,
                                        border: Border.all(color:selectTime==i?bookingButtonColor:timeBorder),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(
                                      child: Text("12:00 PM",style:selectTime==i?AppStyles().categoryColorStyle(): AppStyles().hintColor500TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ))
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 80),
            CustomBottom().bottomRow(
                width: 38, buttonTitle: "Next", title: "Next available", value: "30 May,2024, 11:00 PM")
          ],
        ),
      ),
    );
  }
}
