import 'package:amazone/Block/amazon3_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import 'Repository/ModelClass/AmazonModel3.dart';

class Screen3 extends StatefulWidget {
  final String id;

  const Screen3({super.key, required this.id});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  int currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<Amazon3Bloc>(context).add(FetchAmazon3(id: widget.id));

    // TODO: implement initState
    super.initState();
  }

  late AmazonModel3 data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: 500.w,
          height: 1500.h,
          child:
              BlocBuilder<Amazon3Bloc, Amazon3State>(builder: (context, state) {
            if (state is Amazon3BlocLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (state is Amazon3BlocError) {
              return Center(
                child: Text("Error"),
              );
            }
            if (state is Amazon3BlocLoaded) {
              data = BlocProvider.of<Amazon3Bloc>(context).amazonModel3;
              return ListView.builder(
                itemCount: data.data!.reviews!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    width: 300.w,
                    height: 200,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundImage: NetworkImage(data
                                      .data!.reviews![index].reviewAuthorAvatar
                                      .toString()),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  data.data!.reviews![index].reviewAuthor
                                      .toString(),
                                  style: GoogleFonts.roboto(
                                    color: Color(0xFF414141),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 200),
                            child: RatingBar.builder(
                              itemSize: 20,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              tapOnlyMode: true,
                              allowHalfRating: true,
                              itemCount: 5,
                              // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ReadMoreText(style: TextStyle(
                            fontSize: 10
                          ),
                            data.data!.reviews![index].reviewComment.toString(),
                            trimMode: TrimMode.Line,
                            trimLines: 4,
                            colorClickableText: Colors.pink,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return SizedBox();
            }
          }),
        ),
      ),
    );
  }
}
