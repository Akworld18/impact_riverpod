
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_bottom.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';


import '../utils/app_colors.dart';

class ContinuePayment extends StatefulWidget {
  const ContinuePayment({super.key});

  @override
  State<ContinuePayment> createState() => _ContinuePaymentState();
}

class _ContinuePaymentState extends State<ContinuePayment> {
  TextEditingController controller = TextEditingController();
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
              padding:  EdgeInsets.only(left: 14,top: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Main topic",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  SizedBox(height: 13),
                  PopupMenuButton(
                    constraints: BoxConstraints(
                      maxWidth: size.width *83/100
                    ),
                    offset: Offset(0, -1),
                    position: PopupMenuPosition.under,
                    child: Container(
                      height: 43,
                      width: size.width * 84/100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: timeBorder)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 9,right: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Input",style: AppStyles().mentorTitleColorTextStyle(fontSize: 16),),
                            Icon(Icons.arrow_drop_down_rounded,size: 26,color: hintTextColor,)
                          ],
                        ),
                      ),
                    ),
                    onSelected: (value) {
                      // your logic
                    },
                    itemBuilder: (BuildContext bc) {
                      return  [
                        for(int i=0;i<4;i++)
                        PopupMenuItem(
                          value: '/hello',
                          child: Container(height: 40,width:330,
                          child: Row(
                            children: [
                              Text("About")
                            ],
                          ),),
                        ),
                      ];
                    },
                  ),
                  SizedBox(height: 40),
                  Text("Add your question to this booking.",style: AppStyles().hintColorTextStyle(fontSize: 14),),
                  SizedBox(height: 13),
                  Container(
                    height:150,
                    width: size.width * 84/100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: timeBorder)
                    ),
                    child: TextFormField(
                      style:  AppStyles().mentorTitleColorTextStyle(fontSize: 16),
                      controller: controller,
                      maxLines: 8,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10,right: 10),
                          border: InputBorder.none,
                          hintText: "Input",
                          hintStyle: AppStyles().mentorTitleColorTextStyle(fontSize: 16)

                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottom().bottomRow(
          width: 15, buttonTitle: "Continue payment", title: "Session", value: "30 May,2024, 11:00 PM")
    );
  }
}
