
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:impact_mentor/mentorship/data/repository/mentor_repository.dart';
import 'package:impact_mentor/mentorship/domain/model/booking_saved_response.dart';
import 'package:impact_mentor/mentorship/domain/model/get_mentor_session_response.dart';
import 'package:impact_mentor/mentorship/domain/model/mentor_all_response.dart';
import 'package:impact_mentor/mentorship/domain/model/saveBooking_body_model.dart';
import 'package:impact_mentor/mentorship/domain/model/session_availability.dart';
import 'package:impact_mentor/mentorship/presentation/ui/booking_confirmed.dart';
import 'package:impact_mentor/mentorship/presentation/utils/app_colors.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_bottom.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_text.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BookSession extends StatefulWidget {
  final MentorResponseDataModel? mentorResponseDataModel;
  final GetMentorSessionResponseDataModel? getMentorSessionResponseDataModel;
  const BookSession({super.key, this.mentorResponseDataModel, this.getMentorSessionResponseDataModel});

  @override
  State<BookSession> createState() => _BookSessionState();
}

class _BookSessionState extends State<BookSession> {
  int selectIndex = 0;
  int selectTime = 0;


  // Create a DateFormat object
  DateFormat formatter = DateFormat('d MMM');
  DateFormat weekNameFormatter = DateFormat('EEE');
  DateFormat inputFormat = DateFormat('hh:mm a');
  DateFormat outputFormat = DateFormat('HH:mm');
  ScrollController scrollController = ScrollController();
  bool buttonLoader = false;
  List<String> timeSlots = [];

  String selectedDate = "";
  String selectedTime = "";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child:Icon(Icons.close,color: Colors.white,size: 32,)),
        title: Text("Book Session",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily:"SF-Pro-Display",
            color: Color(0xffDEE2E6)
        ),),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 19,top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Session duration",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  Text("${widget.getMentorSessionResponseDataModel?.session_duration.toString() ?? ""} Mins",style: AppStyles().mentorTitleColorTextStyle(fontSize: 14),),
                  SizedBox(height: 25),
                  Text("About",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  Text(widget.getMentorSessionResponseDataModel?.session_name.toString() ?? "",style: AppStyles().mentorTitleColorTextStyle(fontSize: 14),),
                  SizedBox(height: 20),
                  CustomText().userProfile(decorationImage:  widget.mentorResponseDataModel
                      ?.profile_picture ==
                      ''?ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:Image.asset( height: 50,
                          width: 50,
                          "assets/images/mentor.png",fit: BoxFit.contain))
                      :ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network( height: 50,
                      width: 50,
                      widget.mentorResponseDataModel?.profile_picture ?? '',fit: BoxFit.contain,
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
                      name: "${widget.mentorResponseDataModel?.first_name} ${widget.mentorResponseDataModel?.last_name}",job: "${widget.mentorResponseDataModel?.current_position} at ${widget.mentorResponseDataModel?.company}"),
                  SizedBox(height: 25),
                ],
              ),
            ),
            Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final AsyncValue<MentorSessionResponse> checkActivity = ref.watch(getSessionRequestProvider(widget.getMentorSessionResponseDataModel?.session_id.toString() ?? ""));
              if(checkActivity.isLoading){
                return MentorLoader();
              }
              else if(checkActivity.hasValue){
                List <SessionDayAvailableModel>sessionDayList  = [];
                print(checkActivity.value?.data.toString());
                DateTime serverDate = DateTime.parse(checkActivity.value?.data.responseData.server_time.toString().split('T').first ?? "");
                String formattedDate = formatter.format(serverDate);
                String weekName = weekNameFormatter.format(serverDate);
                sessionDayList.add(SessionDayAvailableModel(dayMonth: formattedDate, dayName: weekName, originalDate: serverDate));
                for(int i=0;i<6;i++){
                  serverDate = serverDate.add(Duration(days: 1));
                  String formatAddedDate = formatter.format(serverDate);
                  String addedWeekName = weekNameFormatter.format(serverDate);
                  sessionDayList.add(SessionDayAvailableModel(dayMonth: formatAddedDate, dayName: addedWeekName, originalDate: serverDate));
                }

                getTimeSlots(0,sessionDayList,checkActivity.value!.data.responseData.availability);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 19,top: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Next available session",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                          SizedBox(height: 17),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for(int i=0;i<sessionDayList.length;i++)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 14),
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          selectIndex=i;
                                          selectTime=0;
                                          timeSlots=[];
                                          selectedDate = "${sessionDayList[i].dayMonth},${sessionDayList[i].originalDate.year}";
                                          getTimeSlots(selectIndex,sessionDayList,checkActivity.value!.data.responseData.availability);
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
                                            Text(sessionDayList[i].dayName.toString().toUpperCase(),style: AppStyles().hintColorTextStyle(fontSize: 10),),
                                            Text(sessionDayList[i].dayMonth.toString(),style: AppStyles().monthTextStyle(fontSize: 14),),
                                            // Text("2 slots",style: AppStyles().slotsTextStyle(),),
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
                                    for(int i=0;i<timeSlots.length;i++)
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10,bottom: 16),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              selectTime=i;
                                              selectedTime = timeSlots[i].toUpperCase().toString();
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
                                              child: Text(timeSlots[i].toUpperCase().toString(),style:selectTime==i?AppStyles().categoryColorStyle(): AppStyles().hintColor500TextStyle(fontSize: 14),),
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ))
                              ],
                            ),
                          ),
                          SizedBox(height: 120),
                        ],
                      ),
                    ),
                    sessionDayList.isEmpty || timeSlots.isEmpty
                        ?SizedBox()
                        :buttonLoader?Center(child: CircularProgressIndicator(),):CustomBottom().bottomRow(onTap: (){
                          setState(() {
                            buttonLoader = true;
                          });
                      ref.read(saveBookingDetailsProvider(SaveBookingModel(
                              bookingTime: "${sessionDayList[selectIndex].originalDate.toString().split(" ").first}T${change12to24Format(timeSlots[selectTime])}:00Z",
                              mentorId: widget.mentorResponseDataModel!.mentor_user_id.toString(),
                              menteeId: 'auth0|65954d18ccd3220acff27ec7',
                              sessionId: widget.getMentorSessionResponseDataModel?.session_id.toString() ?? ""
                          ),context,"${sessionDayList[selectIndex].dayName},${sessionDayList[selectIndex].dayMonth}","${timeSlots[selectTime]} - ${addTimeSlots(timeSlots[selectTime])}",widget.mentorResponseDataModel));
                      setState(() {
                        buttonLoader=false;
                      });
                    },
                        width: 38, buttonTitle: "Next", title: "Next available", value: "${sessionDayList[selectIndex].dayMonth},${sessionDayList[selectIndex].originalDate.year},${timeSlots[selectTime]}")
                  ],
                );
              }
              else {
                return Center(child: Text("Error"));
              }

            },),

          ],
        ),
      ),

    );
  }


  String addTimeSlots(String time){
    DateFormat inputFormat = DateFormat('hh:mm a');
    DateTime dateTime = inputFormat.parse(time);
    DateTime newDateTime = dateTime.add(Duration(minutes: 30));
    DateFormat outputFormat = DateFormat('hh:mm a');
    String newTime12Hour = outputFormat.format(newDateTime);

    return newTime12Hour; // Output: 05:29 PM
  }

  String change12to24Format(String time){
    DateTime start12 = inputFormat.parse(time);
    String start24 = outputFormat.format(start12);
    return start24.toString();
  }

  getTimeSlots(int index,List<SessionDayAvailableModel> sessionList,MentorAvailability availability ){
    List<MentorAvailabilityDates>? availableDay = getAvailableDayList(sessionList[index].dayName.toUpperCase(),availability);

    if(availableDay!.isNotEmpty){
      DateTime start12 = inputFormat.parse(availableDay.first.start_time.toString());
      String start24 = outputFormat.format(start12);
      DateTime end12 = inputFormat.parse(availableDay.first.end_time.toString());
      String end24 = outputFormat.format(end12);
      generateTimeSlots(sessionList[index].originalDate,start24,end24);
    }


  }



  generateTimeSlots(DateTime date,String start,String end){
    DateTime startTime = DateTime(date.year, date.month, date.day, int.parse(start.toString().split(":").first), int.parse(start.toString().split(":").last)); // 4:30 PM on June 13, 2024
    DateTime endTime = DateTime(date.year, date.month, date.day, int.parse(end.toString().split(":").first), int.parse(end.toString().split(":").last)); // 12:30 AM on June 14, 2024

    // Create a DateFormat object for displaying the time
    DateFormat timeFormatter = DateFormat('hh:mm a');

    // Generate time slots
    DateTime currentTime = startTime;

    while (currentTime.isBefore(endTime) || currentTime.isAtSameMomentAs(endTime)) {
      setState(() {
        timeSlots.add(timeFormatter.format(currentTime));
        currentTime = currentTime.add(Duration(minutes: widget.getMentorSessionResponseDataModel!.session_duration!.toInt()));
      });      
    }
    setState(() {
      selectedTime = timeSlots[0].toUpperCase().toString();
      scrollController.animateTo(
          scrollController.position.maxScrollExtent + 1000,
          duration: Duration(milliseconds: 5),
          curve: Curves.fastOutSlowIn);
    });

  }

  List<MentorAvailabilityDates>? getAvailableDayList(String weekName,MentorAvailability availability ){
    switch(weekName) {
      case "THU":
        return availability.thursday;
      case  "FRI":
        return availability.friday;
      case "SAT":
        return availability.saturday;
      case "SUN":
        return availability.sunday;
      case "MON":
        return availability.monday;
      case "TUE":
        return availability.tuesday;
      case "WED":
        return availability.wednesday;
      default:
        return [];
    }

  }
}




class SessionDayAvailableModel{
  String dayName;
  String dayMonth;
  DateTime originalDate;
  SessionDayAvailableModel({required this.dayMonth,required this.dayName,required this.originalDate});
}
