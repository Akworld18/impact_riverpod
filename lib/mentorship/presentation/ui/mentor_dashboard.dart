import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impact_mentor/mentorship/data/repository/mentor_repository.dart';
import 'package:impact_mentor/mentorship/domain/model/mentor_all_response.dart';
import 'package:impact_mentor/mentorship/presentation/ui/bookings.dart';
import 'package:impact_mentor/mentorship/presentation/ui/mentor_profile.dart';
import 'package:impact_mentor/mentorship/presentation/utils/app_colors.dart';
import 'package:impact_mentor/mentorship/presentation/utils/customBox.dart';
import 'package:impact_mentor/mentorship/presentation/utils/custom_bottom.dart';
import 'package:impact_mentor/mentorship/presentation/utils/textstyles.dart';




class MentorDashboard extends StatefulWidget {
  const MentorDashboard({super.key});

  @override
  State<MentorDashboard> createState() => _MentorDashboardState();
}

class _MentorDashboardState extends State<MentorDashboard> {
  TextEditingController controller = TextEditingController();
  List categoryRow = ["All", "Available ASAP", 'Recommended'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String searchName = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff191C1F),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: GestureDetector(
          onTap: () {
            setState(() {
              searchName = "NAME";
            });
          },
          child: Text(
            "Mentors",
            style: AppStyles().mentorTitleColorTextStyle(fontSize: 22),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingsScreen()));
              },
              child: Container(
                height: 32,
                width: size.width * 30 / 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff22AF6A))),
                child: Center(
                  child: Text(
                    "Bookings",
                    style: AppStyles().bookingButtonColorTextStyle(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: searchButtonBackground),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Image.asset("assets/images/search.png",
                        height: size.height * 7 / 100,
                        width: size.width * 7 / 100,
                        fit: BoxFit.cover),
                  ),
                  SizedBox(width: size.width * 4 / 100),
                  SizedBox(
                    width: size.width * 75 / 100,
                    child: TextFormField(
                      style: AppStyles().whiteTextStyle(fontSize: 16),
                      controller: controller,
                      onChanged: (value) {
                        setState(() {
                          searchName = value;
                          log(value.toString());
                        });
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          // suffixIcon: Image.asset("assets/images/filter.png"),
                          hintText: "Search Courses",
                          hintStyle:
                              AppStyles().hintColorTextStyle(fontSize: 16)),
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
          const SizedBox(height: 20),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final AsyncValue<MentorAllModel> activity =
                  ref.watch(getAllMentorsProvider(searchName));
              // log(activity.value!.responseData.length.toString());
              if (activity.isLoading) {
                return const MentorLoader();
              } else if (activity.hasValue) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 10),
                    child: SizedBox(
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: activity.value!.responseData.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 280,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 14,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Container(
                              width: size.width * 45 / 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff23272B)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: size.width * 45 / 100,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                        ),
                                        child: activity
                                            .value
                                            ?.responseData[index]
                                            .profile_picture == ''
                                            ?ClipRRect(
                                          borderRadius:
                                          const BorderRadius.only(
                                              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                              child: Image.asset("assets/images/mentor.png",width: size.width * 45 / 100,
                                              height: 150,fit: BoxFit.contain),
                                            )
                                            :ClipRRect(
                                          borderRadius:
                                            const BorderRadius.only(
                                            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                              child:Image.network(activity
                                              .value
                                              ?.responseData[index]
                                              .profile_picture ??
                                              '',width: size.width * 45 / 100,
                                              height: 150,fit: BoxFit.contain,
                                                errorBuilder: (context,st,s){
                                                return ClipRRect(
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                                  child: Image.asset("assets/images/mentor.png",width: size.width * 45 / 100,
                                                      height: 150,fit: BoxFit.contain),
                                                );
                                                                                        },
                                                                                      ),
                                            ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 10, right: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              activity
                                                      .value
                                                      ?.responseData[index]
                                                      .first_name ??
                                                  '',
                                              style: AppStyles()
                                                  .nameInCardStyle(
                                                      fontSize: 14),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "${activity.value?.responseData[index].current_position ?? ''} at ${activity.value?.responseData[index].location ?? ''}",
                                              style: AppStyles()
                                                  .hintColorTextStyle(
                                                      fontSize: 10),
                                            ),
                                            // const SizedBox(height: 5),
                                            // CustomText().starWithReview(),
                                            // const SizedBox(height: 8),
                                            // Text(
                                            //   "₹000",
                                            //   style: AppStyles().valueInCardStyle(),
                                            // ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        // padding: EdgeInsets.only(bottom: 30),
                                        child: CustomBox().sessionButton(
                                            height: 3,
                                            width: 9,
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return MentorProfile(
                                                      mentorResponseDataModel: activity.value?.responseData[index],
                                                      );
                                                    }));
                                            },
                                            title: "Book Session"),
                                      ),
                                      const SizedBox(height: 15)
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                );
              } else {
                return Container();
              }

              // return Column(
              //   children: [],
              // );
            },
          )
        ],
      ),
    );
  }
}
