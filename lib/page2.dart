import 'package:amazone/Block/amazon2_bloc.dart';
import 'package:amazone/page3.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Repository/ModelClass/AmazonModel2.dart';

class Screen2 extends StatefulWidget {
  final String productphoto;
  final String text;
  final String price;
  final String id;

  const Screen2({
    super.key,
    required this.productphoto,
    required this.text,
    required this.price,required this.id
  });

  @override
  State<Screen2> createState() => _Screen2State();
}


class _Screen2State extends State<Screen2> {
  int currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<Amazon2Bloc>(context).add(FetchAmazon2(id: widget.id));

    // TODO: implement initState
    super.initState();
  }
  late AmazonModel2 data;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Scaffold(
      appBar: AppBar(
        leading: Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_circle_left_outlined,
                color: Colors.black,
                size: 35,
              ),
            )),
        actions: [
          Stack(
            children: [
              Icon(
                Icons.notifications_none,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.blue,
                ),
              )
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          Stack(
            children: [
              Icon(Icons.favorite_border, size: 30),
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 30),
                child: CircleAvatar(
                  radius: 6.r,
                  backgroundColor: Color(0x198204FF),
                  child: Text(
                    '1',
                    style: GoogleFonts.roboto(
                      color: Color(0xFF8204FF),
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<Amazon2Bloc, Amazon2State>(
          builder: (context, state) {
    if (state is Amazon2BlocLoading)
    return Center(
    child: CircularProgressIndicator(),
    );
    if (state is Amazon2BlocError) {
    return Center(
    child: Text("Error"),
    );
    }
    if (state is Amazon2BlocLoaded) {
    data = BlocProvider.of<Amazon2Bloc>(context).amazonModel2;
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: data.data!.productPhotos!.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex,
                      int pageViewIndex) =>
                      Container(
                        child: Image.network(    data.data!.productPhotos![itemIndex].toString(),),
                      ),
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: currentIndex,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    onPageChanged: (index, c) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    autoPlayInterval: Duration(seconds: 1),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: 6,
                  effect: WormEffect(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 50),
                  child: Row(
                    children: [
                      SizedBox(width: 230,
                        child: Text(
                          widget.text,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 89.w,
                        height: 36.h,
                        decoration: ShapeDecoration(
                          color: Color(0x198204FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.discount,
                                size: 25,
                                color: Color(0xFF8204FF),
                              ),
                              Text(
                                'On sale',
                                style: GoogleFonts.roboto(
                                  color: Color(0xFF8204FF),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ), SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        widget.price,
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' \$300',
                        style: GoogleFonts.roboto(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 89.w,
                        height: 36.h,
                        decoration: ShapeDecoration(
                          color: Color(0x19FF8037),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Colors.orange,
                                size: 30,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                '4.2',
                                style: GoogleFonts.roboto(
                                  color: Color(0xFF414141),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 89.w,
                        height: 36.h,
                        decoration: ShapeDecoration(
                          color: Color(0x191F7DFD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: Colors.blue,
                                size: 30,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                '3.8',
                                style: GoogleFonts.roboto(
                                  color: Color(0xFF414141),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      TextButton(
                        onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen3(id:widget.id))); },
                        child: Text(
                          '132 Reviews',
                          style: GoogleFonts.roboto(
                            color: Color(0xFF414141),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 260, top: 20),
                  child: Text(
                    'Color',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x19FF8037),
                        radius: 15.r,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 15.r,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFF8204FF),
                        radius: 15.r,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFF133568),
                        radius: 15.r,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 240),
                  child: Text(
                    'Description',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
            data.data!.aboutProduct![0].toString(),
                    style: GoogleFonts.roboto(
                      color: Color(0xFF414141),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 230),
                  child: Text(
                    'Specification',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    children: [
                      Text(
                        'Model Name',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF414141),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 110.w,
                      ),
                      Text(
                        'Boat Airdopes 121V2',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF414141),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: [
                      Text(
                        'Color',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF414141),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 160.w,
                      ),
                      Text(
                        'Gray',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF414141),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 320.w,
                  height: 76.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 100.w,
                          height: 50.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFF8204FF),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '-   1   +',
                              style: TextStyle(
                                color: Color(0xFF8204FF),
                                fontSize: 22.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 100.w,
                          height: 50.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFF8204FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_shopping_cart_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                Text(
                                  'By now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0x198204FF),
                          radius: 30,
                          child: Icon(Icons.favorite_border,
                              color: Color(0xFF8204FF), size: 35),
                        )
                      ],
                    ),
                  ),
                ),
              ],

            );

          }
            else {
            return SizedBox();
            }
        }
        ),
      ),
    );
  }
}
