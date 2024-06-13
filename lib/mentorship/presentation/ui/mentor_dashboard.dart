import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impact_mentor/mentorship/presentation/utils/app_colors.dart';
import 'package:impact_mentor/mentorship/presentation/utils/customBox.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_text.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';


class MentorDashboard extends StatefulWidget {
  const MentorDashboard({super.key});

  @override
  State<MentorDashboard> createState() => _MentorDashboardState();
}

class _MentorDashboardState extends State<MentorDashboard> {
  TextEditingController controller = TextEditingController();
  List categoryRow = ["All","Available ASAP",'Recommended'];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff191C1F),
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Text("Mentors",style: AppStyles().mentorTitleColorTextStyle(fontSize: 22),),
        actions: [
          Padding(
            padding:EdgeInsets.only(right: 12),
            child: Container(
              height: 32,
              width: size.width *30/100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xff22AF6A))
              ),
              child: Center(
                child: Text("Bookings",style: AppStyles().bookingButtonColorTextStyle(),),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding:  EdgeInsets.only(left: 12,right: 12),
            child: Container(
              height:56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: searchButtonBackground
              ),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 14),
                    child: Image.asset("assets/images/search.png",height: size.height * 7/100,width: size.width * 7/100,fit: BoxFit.cover),
                  ),
                  SizedBox(width: size.width * 4/100),
                  SizedBox(
                    width: size.width *75/100,
                    child: TextFormField(
                      style:AppStyles().whiteTextStyle(fontSize: 16) ,
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Image.asset("assets/images/filter.png"),
                        hintText: "Search Courses",
                        hintStyle:AppStyles().hintColorTextStyle(fontSize: 16)
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
          // SizedBox(height: 20),
          // Padding(
          //   padding:  EdgeInsets.only(left: 13),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: [
          //         for(int i=0;i<categoryRow.length;i++)
          //           Padding(
          //             padding:  EdgeInsets.only(right: 15),
          //             child: Container(
          //
          //               decoration: BoxDecoration(
          //                   color: Colors.brown.withOpacity(0.2),
          //                   borderRadius: BorderRadius.circular(8)
          //               ),
          //               child: Padding(
          //                 padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
          //                 child: Row(
          //                   children: [
          //                     Image.asset("assets/images/all.png",height: 20,width: 20,fit: BoxFit.contain,),
          //                     SizedBox(width: 12),
          //                     Text(categoryRow[i].toString(),style: AppStyles().categoryColorStyle(),)
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           )
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: 20),
          Expanded(
            child:Padding(
              padding:  EdgeInsets.only(left: 12,right: 10),
              child: SizedBox(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 340,
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
                        Container(
                          width: size.width * 45/100,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              image: DecorationImage(image: AssetImage("assets/images/mentor.png"),fit: BoxFit.cover)
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 8,top: 10,right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Anna Arteera diay an",style: AppStyles().nameInCardStyle(fontSize:  14),overflow: TextOverflow.ellipsis,),
                              SizedBox(height: 5),
                              Text("Head of product design at Payoneer",style: AppStyles().hintColorTextStyle(fontSize: 10),),
                              SizedBox(height: 5),
                              CustomText().starWithReview(),
                              SizedBox(height: 8),
                              Text("₹000",style: AppStyles().valueInCardStyle(),),
                              SizedBox(height: 12),
                              CustomBox().sessionButton(height: 3, width: 9, onTap: (){}, title: "Book Session")
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
    );
  }
  

}
