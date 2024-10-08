import 'package:amazone/Block/amazon_bloc.dart';
import 'package:amazone/Repository/ModelClass/AmazonModel.dart';
import 'package:amazone/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late AmazonModel data;

  @override
  void initState() {
    BlocProvider.of<AmazonBloc>(context).add(FetchAmazon());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 10.r,
          backgroundColor: Color(0xFFE5DCFC),
          child: Center(child: Image.asset('assets/a.png')),
        ),
        title: Text(
          'Wizo',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: ("search"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 210.w,
                  ),
                  Text(
                    'See all',
                    style: GoogleFonts.roboto(
                      color: Color(0xFF8204FF),
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
            Image.asset("assets/c.png"),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Text(
                    'Featured products',
                    style: GoogleFonts.roboto(
                      color: Color(0xFF414141),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 180.w,
                  ),
                  Text(
                    'See all',
                    style: GoogleFonts.roboto(
                      color: Color(0xFF8204FF),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<AmazonBloc, AmazonState>(builder: (context, state) {
              if (state is AmazonBlocLoading)
                return Center(
                  child: CircularProgressIndicator(),
                );
              if (state is AmazonBlocError) {
                return Center(
                  child: Text("Error"),
                );
              }
              if (state is AmazonBlocLoaded) {
                data = BlocProvider.of<AmazonBloc>(context).amazonModel;

                return SizedBox(
                  height: 500.h,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    children: List.generate(
                      data.data!.products!.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color(0xFFE5DCFC),
                              shape: (RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                              )),
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => Screen2(productphoto: data
                                        .data!.products![index].productPhoto
                                        .toString(),
                                              text:  data.data!.products![index].productTitle
                                                .toString(), price: data.data!.products![index].productPrice
                                                  .toString(), id: data
                                                  .data!.products![index].asin.toString(),

                                             )));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: (RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.r),
                                        ),
                                      )),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Image.network(data
                                            .data!.products![index].productPhoto
                                            .toString())),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 30, top: 5),
                                  child: Text(
                                    data.data!.products![index].productTitle
                                        .toString(),
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),maxLines: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.data!.products![index].productPrice
                                            .toString(),
                                        style: GoogleFonts.roboto(
                                          color: Color(0xFF8204FF),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add_shopping_cart_sharp,
                                        color: Color(0xFF8204FF),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
