import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impact_mentor/mentorship/data/repository/mentor_repository.dart';
import 'package:impact_mentor/mentorship/domain/model/booking_details_model.dart';
import 'package:impact_mentor/mentorship/presentation/utils/app_colors.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_bottom.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_text.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';


class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int selectType = 0;
  List category = ['Upcoming','Pending','Completed'];
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
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text("Bookings",style: AppStyles().mentorTitleColorTextStyle(fontSize: 22),),
              SizedBox(height: 3),
              Text("The session timings are following your local timezone Asia/Calcutta Update",style: AppStyles().hintColorTextStyle(fontSize: 12),),
              SizedBox(height: 20),
              Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final AsyncValue<BookingDetailsResponse> checkActivity = ref.watch(getBookingDetailsProvider('completed'));

                List<BookingResponseData> responseData =checkActivity.hasValue? checkActivity.value!.data.responseData:[];
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for(int i=0;i<category.length;i++)
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: (){
                              setState(() {
                                selectType=i;
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
                if(checkActivity.hasValue)
                      Column(
                children: [
                            for (int i = 0; i < responseData.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
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
                                        Text(
                                          "June 28, Sat - 04:00 PM - 05:00 PM IST",
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
                                            CustomText().userProfile(),
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
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: sessionButtonColor),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Center(
                                                  child: Text(
                                                    "Join meeting",
                                                    style: AppStyles()
                                                        .sessionButtonTextStyle(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ],
                        )
                      else if (checkActivity.isLoading)
                        MentorLoader()
                      else
                        Center(child: Text("Error Found"))
                    ],
                );

              },),

            ],
          ),
        ),
      ),
    );
  }
}
