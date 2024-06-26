
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:impact_mentor/mentorship/presentation/utils/app_colors.dart';
import 'package:impact_mentor/mentorship/presentation/utils/customBox.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_bottom.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';


class MentorProfile extends StatefulWidget {
  const MentorProfile({super.key});

  @override
  State<MentorProfile> createState() => _MentorProfileState();
}

class _MentorProfileState extends State<MentorProfile> {
  List interest = ['Angular','Artificial intelligence','UX','Business news','Python','After effects','Adobe XD'];
  List socialLinkImage = ['assets/images/linked.png','assets/images/all.png','assets/images/github.png','assets/images/behance.png','assets/images/dribble.png'];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Text("Mentor Profile",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily:"SF-Pro-Display",
            color: Color(0xffDEE2E6)
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert,color: Color(0xffC1C6CC),),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Color(0xff191C1F),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 102,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image:DecorationImage(image:  AssetImage('assets/images/background.png'),fit: BoxFit.cover)
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 18,
                        child:Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            image: DecorationImage(image: AssetImage("assets/images/mentor.png"),fit: BoxFit.cover)
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 60),
                  Padding(
                    padding:  EdgeInsets.only(left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jourdan Lewis",style: AppStyles().whiteTextStyle(fontSize: 14),),
                        SizedBox(height: 5),
                        Text("Powerful Vector Design for Everyone Designing for the future, Crafting digital experiences AI design",style: AppStyles().mentorTitleColorTextStyle(fontSize: 14),),
                        SizedBox(height: 2),
                        Text("Senior UX UI Designer at impacteers.club",style:  AppStyles().mentorTitleColorTextStyle(fontSize: 14),),
                        SizedBox(height: 5),
                        Text("Chennai, India",style:  AppStyles().mentorTitleColorTextStyle(fontSize: 14),)

                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:  EdgeInsets.only(left: 17),
                    child: Container(
                      width: size.width * 94/100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xff23272B),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Row(
                          children: [
                            Text("Open to work | ",style:AppStyles().customColorStyle(color: mentorProfileRowColor),),
                            Text("Can join in ",style: AppStyles().customColorStyle(color: mentorProfileRowMiddleColor),),
                            Text("15 days or less",style: AppStyles().customColorStyle(color: mentorProfileRowColor),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(width: double.infinity,color: Color(0xff191C1F),
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text("Total years of experience",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  SizedBox(height: 7),
                  Text("7 Years & 5 Months",style: AppStyles().yearExpStyle(fontWeight: FontWeight.w500),),
                  SizedBox(height: 18),
                  Text("Bio",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  SizedBox(height: 9),
                  Text("Versatile researcher & designer with extensive service design, UX strategy & UI design/dev background. Creative & web tech enthusiast. I began my career as a sequential artist, writing and illustrating my own stories. Now I do work as a researcher, and strive to uncover and tell the stories I discover in design research.",
                    style: AppStyles().mentorTitleColorTextStyle(fontSize: 14),),
                  SizedBox(height: 23),
                  Text("Community Statistics",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBox().trophyBox(title: 'Total Mentoring time', value: '510 Mins', size: size),
                        CustomBox().trophyBox(title: 'Sessions completed', value: '24', size: size),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBox().trophyBox(title: 'Average attendance', value: '85%', size: size),
                        CustomBox().trophyBox(title: 'Coins  points', value: '223', size: size),

                      ],
                    ),
                  ),
                  SizedBox(height: 23),
                  Text("Interest",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,top: 14),
                    child: Row(
                      children: [
                        Flexible(child: Wrap(
                          children: [
                            for(int i=0;i<interest.length;i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 10,bottom: 16),
                              child: SizedBox(
                                width: widthAdjust(interest[i].toString()),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/trophy.png',height: 18,width: 18,fit: BoxFit.cover,),
                                    SizedBox(width: 8),
                                    Text(interest[i].toString(),style: AppStyles().categoryColorStyle(),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: 23),
                  Text("Social links",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,top: 18,bottom: 29),
                    child: Row(
                      children: [
                        for(int i=0;i<socialLinkImage.length;i++)
                          Padding(
                            padding:  EdgeInsets.only(right: 19,left: 3),
                            child: Image.asset(socialLinkImage[i].toString(),height: 24,width: 24,fit: BoxFit.cover,),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),),
            SizedBox(height: 10),
            Container(
              height: size.height * 60/100,
              width: double.infinity,color: Color(0xff191C1F),
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14),
                    Text("Sessions",style: AppStyles().sessionTitleColorTextStyle(fontSize:16 ),),
                    SizedBox(height: 19),
                    Expanded(
                      child:Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: SizedBox(
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 302,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 14,
                                  crossAxisCount: 2), itemBuilder: (context,index){
                            return Container(
                              width: size.width * 45/100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:Color(0xff23272B)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: 8,top: 10,right: 4),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 13),
                                              child: Text("30 min",style: AppStyles().hintColorTextStyle(fontSize: 12),),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 18),
                                        Text("Resume & Portfolio review",style: AppStyles().nameInCardStyle(fontSize:  16),),
                                        Text("Get actionable feedback on your resume or portfolio",style: AppStyles().hintColorTextStyle(fontSize:  12),),
                                        SizedBox(height: 8),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset("assets/images/star.png",height: 14,width: 14,fit: BoxFit.contain,),
                                            SizedBox(width:3),
                                            SizedBox(
                                              width: size.width * 36/100,
                                              child: Text("15% OFF for Pro Users Go Pro",style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:"SF-Pro-Display",
                                                  color: Color(0xffADB5BD)),),
                                            ),
                                          ],
                                        ),
                                        Text("₹000",style: AppStyles().valueInCardStyle(),),
                                        SizedBox(height: 12),
                                        CustomBox().sessionButton(height: 3, width: 9, onTap: (){},title: "Book Session"),
                                        SizedBox(height: 20)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    )
                  ],
                ),
              ),),
            SizedBox(height: 10),
            Container(width: double.infinity,color: Color(0xff191C1F),
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14),
                    Text("How to work with me",style: AppStyles().sessionTitleColorTextStyle(fontSize: 16),),
                    SizedBox(height: 22),
                    for(int i=0;i<3;i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('What i can offer?',style:AppStyles().sessionTitleColorTextStyle(fontSize: 16)),
                            SizedBox(height: 4),
                            Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed voluptua. ',style:AppStyles().hintColorTextStyle(fontSize: 12)),

                          ],
                        ),
                      )
                  ],
                ),
              ),),
            SizedBox(height: 90),
            CustomBottom().bottomRow(
                width: 24, buttonTitle: "Check availibitly", title: "Next available", value: "30 May,2024, 11:00 PM")
          ],
        ),
      ),
    );
  }

  double widthAdjust(String title){
    if(title.length < 5){
      return 60;
    }
    else if(title.length < 8){
      return 100;
    }
    else if(title.length < 12){
      return 140;
    }
    else if(title.length < 16){
      return 170;
    }
    else if(title.length < 20){
      return 200;
    }
    else if(title.length < 25){
      return 240;
    }
    else if(title.length < 30){
      return 280;
    }
    else{
      return 120;
    }
  }
  
}
