import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impact_mentor/mentorship/data/repository/mentor_repository.dart';
import 'package:impact_mentor/mentorship/domain/model/booking_details_model.dart';
import 'package:impact_mentor/mentorship/domain/model/get_mentor_session_response.dart';
import 'package:impact_mentor/mentorship/domain/model/mentor_all_response.dart';
import 'package:impact_mentor/mentorship/presentation/utils/app_colors.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_bottom.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_text.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';
import 'package:intl/intl.dart';


class BookingsScreen extends StatefulWidget {

  const BookingsScreen({super.key,});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int selectType = 0;
  List category = ['Upcoming','Pending','Completed'];

  String selectCategoryType = "upcoming";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff191C1F),
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Text("Bookings",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily:"SF-Pro-Display",
            color: Color(0xffDEE2E6)
        ),),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Text("Bookings",style: AppStyles().mentorTitleColorTextStyle(fontSize: 22),),
            SizedBox(height: 3),
            Text("The session timings are following your local timezone Asia/Calcutta Update",style: AppStyles().hintColorTextStyle(fontSize: 12),),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for(int i=0;i<category.length;i++)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      setState(() {
                        selectType=i;
                        selectCategoryType = category[i].toString().toLowerCase();
                      });
                    },
                    child:Padding(
                      padding:  EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Text(category[i].toString(),style: selectType==i?AppStyles().bookingButtonColorTextStyle():AppStyles().hintColor500TextStyle(fontSize: 14),),
                          SizedBox(height: 7),
                          selectType==i?
                          Image.asset('assets/images/indicator.png',height: 16,width: i==0?80:i==1?70:90,fit: BoxFit.cover,):SizedBox()
                        ],
                      ),
                    ),
                  )
              ],
            ),
            Container(
              height: 1,
              width: size.width * 90/100,
              decoration: BoxDecoration(
                  color: trophyBoxColor
              ),
            ),
            SizedBox(height: 17),
            Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final AsyncValue<BookingDetailsResponse> checkActivity = ref.watch(getBookingDetailsProvider(selectCategoryType));

              List<BookingResponseData> responseData =checkActivity.hasValue? checkActivity.value!.data.responseData:[];
              if(checkActivity.hasValue){
                return Expanded(
                  child:SizedBox(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        for (int i = 0; i < responseData.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 10,top: 15),
                            child: Container(
                              width: size.width * 96 / 100,
                              decoration: BoxDecoration(
                                color: searchButtonBackground,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 9, right: 9, top: 20),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Session duration",
                                      style: AppStyles()
                                          .hintColorTextStyle(fontSize: 14),
                                    ),
                                    Text(convertTimeFormat(responseData[i].booked_time.toString()),
                                      style: AppStyles()
                                          .mentorTitleColorTextStyle(
                                          fontSize: 14),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "About",
                                      style: AppStyles()
                                          .hintColorTextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      responseData[i].session_name ?? "",
                                      style: AppStyles()
                                          .mentorTitleColorTextStyle(
                                          fontSize: 14),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        CustomText().userProfile(decorationImage:responseData[i]
                                            .profile_picture ==
                                            ''?ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child:Image.asset( height: 50,
                                                width: 50,
                                                "assets/images/mentor.png",fit: BoxFit.contain))
                                            :ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: Image.network( height: 50,
                                            width: 50,
                                            responseData[i].profile_picture ?? '',fit: BoxFit.contain,
                                            errorBuilder: (context,st,s){
                                              return ClipRRect(
                                                borderRadius: BorderRadius.circular(100),
                                                child:Image.asset(
                                                    height: 50,
                                                    width: 50,
                                                    "assets/images/mentor.png",fit: BoxFit.cover),
                                              );
                                            },),
                                        ),
                                            name: "${responseData[i].first_name} ${responseData[i].last_name}",job: "${responseData[i].current_position} at ${responseData[i].company}"),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: timeBorder),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 18,
                                                right: 18,
                                                top: 7,
                                                bottom: 7),
                                            child: Center(
                                              child: Text(
                                                'Chat',
                                                style: AppStyles()
                                                    .bookingButtonColorTextStyle(),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Cancel",
                                          style: AppStyles()
                                              .cancelColorTextStyle(),
                                        ),
                                        SizedBox(width: 40),
                                        selectCategoryType == "upcoming"
                                            ?actionButton("Join meeting", sessionButtonColor)
                                            :selectCategoryType == "pending"
                                            ?actionButton("Waiting for approval", Color(0xff848F99))
                                            :actionButton('Write a review ', sessionButtonColor)

                                      ],
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                      ),
                    ),
                  ),
                );}
              else if (checkActivity.isLoading){
                return MentorLoader();
              }
              else {
                return Center(child: Text("Error Found"));
              }
            },),

          ],
        ),
      ),
    );
  }


  actionButton(String text,Color color){
    return  Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(7),
          color: color),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15, right: 15),
        child: Center(
          child: Text(
            text,
            style: AppStyles()
                .sessionButtonTextStyle(),
          ),
        ),
      ),
    );
  }

  String convertTimeFormat(String bookingTime){
    // Parse the ISO 8601 datetime string to a DateTime object
    DateTime dateTime = DateTime.parse(bookingTime).toLocal();

    // Create DateFormat objects for the desired formats
    DateFormat dateFormatter = DateFormat('MMMM d, EEE');
    DateFormat timeFormatter = DateFormat('hh:00 a');

    // Format the date and time
    String formattedDate = dateFormatter.format(dateTime);
    String formattedStartTime = timeFormatter.format(dateTime);
    String formattedEndTime = timeFormatter.format(dateTime.add(Duration(hours: 1)));

    // Combine the formatted date and times with the timezone
    String formattedDateTime = "$formattedDate - $formattedStartTime - $formattedEndTime IST";
    return formattedDateTime;
  }
}
