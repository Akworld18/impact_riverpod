import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impact_mentor/mentorship/presentation/utils/app_colors.dart';
import 'package:impact_mentor/mentorship/presentation/utils/customBox.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_text.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';
class BookingConfirmedScreen extends StatefulWidget {
  const BookingConfirmedScreen({super.key});

  @override
  State<BookingConfirmedScreen> createState() => _BookingConfirmedScreenState();
}
class _BookingConfirmedScreenState extends State<BookingConfirmedScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.close,color: Colors.white,size: 32,),
        title: Text("Booking Confirmed",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily:"SF-Pro-Display",
            color: Color(0xffDEE2E6)
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Center(child: Image.asset("assets/images/confirmed.png",height: 142,width: 154,fit: BoxFit.cover,)),
            Text('Booking confirmed',style:AppStyles().mentorTitleColorTextStyle(fontSize: 14) ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('For your session ',style:AppStyles().customColorStyle(color: timeBorder) ,),
                Text('Resume & Portfolio review',style:AppStyles().mentorTitleColorTextStyle(fontSize: 14) ,),
              ],
            ),
            SizedBox(height: 20),
            Text('Your session has been confirmed. Waiting for mentor has approval your request, check email for calendar invite.',style:AppStyles().customColorStyle(color: timeBorder),textAlign: TextAlign.center,),
            SizedBox(height: 35),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Mentorship session Booking with ',style:AppStyles().customColor12Style(color: timeBorder) ,textAlign: TextAlign.center,),
                Text("Anna Arteeva diya an",style: AppStyles().customColor12Style(color: sessionButtonColor),textAlign: TextAlign.center,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today_outlined,color: confirmTextColor,size: 15,),
                SizedBox(width: 3),
                Text('Sat, Jun 28 ',style: AppStyles().customColorStyle(color: confirmTextColor),),
                Icon(Icons.access_time_outlined,color: confirmTextColor,size: 15,),
                SizedBox(width: 3),
                Text('4:00 PM  - 5:00 PM IST',style: AppStyles().customColorStyle(color: confirmTextColor),),

              ],
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               CustomText().userProfile(),
                CustomBox().chatBox()
              ],
            ),
            SizedBox(height: 120),
            CustomBox().sessionButton(height: 10, width: 38, onTap: (){}, title: "Manage Bookings")
          ],
        ),
      ),

    );
  }
}
