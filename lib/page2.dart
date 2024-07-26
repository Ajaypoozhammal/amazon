import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int currentIndex = 0;

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
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 15,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              child: Image.asset('assets/b.png'),
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
          SizedBox(height: 30.h,),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: 6,
            effect: WormEffect(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 50),
            child: Row(
              children: [
                Text(
                  'Headphone',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
SizedBox(width: 160.w,),
                Container(
                  width: 89,
                  height: 36,
                  decoration: ShapeDecoration(
                    color: Color(0x198204FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.discount,size: 25,color: Color(0xFF8204FF),),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 280),
            child: Text(
              '\$155  \$300',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
