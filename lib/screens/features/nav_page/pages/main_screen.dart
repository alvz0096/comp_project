import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/size_config.dart';
import '../../home/view_doctor_information.dart';
import '../../search/search_page.dart';
import '../bloc/corousel_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: BlocBuilder<CorouselBloc, CorouselState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              color: themeProvider.themeMode().primaryThemeColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(15),
                              top: getProportionateScreenWidth(15),
                            ),
                            height: getProportionateScreenHeight(60),
                            width: getProportionateScreenWidth(60),
                            child: Image.asset("assets/images/logo.png"),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(10),
                              top: getProportionateScreenWidth(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello user',
                                  style: TextStyle(
                                    color: themeProvider.themeMode().themeColor,
                                    fontSize: getProportionateScreenHeight(18),
                                  ),
                                ),
                                Text(
                                  'Good Morning',
                                  style: TextStyle(
                                    color: themeProvider.themeMode().themeColor,
                                    fontSize: getProportionateScreenHeight(14),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              themeProvider.toggleThemeData();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: getProportionateScreenHeight(10),
                                right: getProportionateScreenHeight(10),
                              ),
                              width: getProportionateScreenWidth(45),
                              height: getProportionateScreenHeight(45),
                              decoration: BoxDecoration(
                                color: themeProvider
                                    .themeMode()
                                    .primaryTransparentColor,
                                borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(10),
                                ),
                              ),
                              child: Icon(
                                Icons.light_mode_rounded,
                                color: themeProvider.themeMode().themeColor,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: getProportionateScreenHeight(10),
                              right: getProportionateScreenHeight(10),
                            ),
                            width: getProportionateScreenWidth(45),
                            height: getProportionateScreenHeight(45),
                            decoration: BoxDecoration(
                              color: themeProvider
                                  .themeMode()
                                  .primaryTransparentColor,
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenHeight(10),
                              ),
                            ),
                            child: Icon(
                              Icons.notifications_rounded,
                              color: themeProvider.themeMode().themeColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Divider(
                    color: themeProvider.themeMode().themeColor,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(10)),
                        child: Row(
                          children: [
                            Text(
                              'Find',
                              style: TextStyle(
                                color: themeProvider.themeMode().themeColor,
                                fontSize: getProportionateScreenWidth(27),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenWidth(7)),
                              child: Text(
                                'your doctor',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: getProportionateScreenWidth(27),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Form(
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          final show = SnackBar(
                            content: Text(
                              'Search Bar Function',
                              style: TextStyle(
                                color: themeProvider.themeMode().themeColor,
                                fontSize: getProportionateScreenWidth(17),
                                fontFamily: 'Baloo',
                              ),
                            ),
                            duration: const Duration(seconds: 2),
                            elevation: 2.0,
                            clipBehavior: Clip.antiAlias,
                            backgroundColor:
                                themeProvider.themeMode().primaryThemeColor,
                            behavior: SnackBarBehavior.floating,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(show);

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SearchPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: getProportionateScreenHeight(10),
                              bottom: getProportionateScreenHeight(20)),
                          height: getProportionateScreenHeight(50),
                          width: getProportionateScreenWidth(355),
                          decoration: BoxDecoration(
                              color: themeProvider.themeMode().cardColor,
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    getProportionateScreenWidth(13)),
                              )),
                          child: TextFormField(
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(14)),
                            decoration: InputDecoration(
                              enabled: false,
                              isDense: true,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: themeProvider.themeMode().themeColor,
                                fontSize: getProportionateScreenWidth(17),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(10)),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenWidth(13))),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: kPrimarySecondColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenWidth(13))),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                  top: getProportionateScreenHeight(10),
                                  bottom: getProportionateScreenHeight(10),
                                ),
                                child: SizedBox(
                                  height: getProportionateScreenHeight(10),
                                  width: getProportionateScreenWidth(10),
                                  child: const Icon(Icons.search_outlined),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: getProportionateScreenWidth(160),
                          aspectRatio: 10.0,
                          enlargeCenterPage: true,
                          onPageChanged: (index, yes) {
                            state.page = index;
                            BlocProvider.of<CorouselBloc>(context)
                                .add(CorouselEvent());
                            print(index);
                          },
                        ),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: getProportionateScreenWidth(
                                    double.infinity),
                                margin: EdgeInsets.only(
                                  right: getProportionateScreenHeight(5),
                                  left: getProportionateScreenHeight(5),
                                  top: getProportionateScreenHeight(10),
                                  bottom: getProportionateScreenHeight(10),
                                ),
                                decoration: BoxDecoration(
                                  color: themeProvider.themeMode().hmColor,
                                  borderRadius: BorderRadius.circular(
                                    getProportionateScreenWidth(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeProvider
                                          .themeMode()
                                          .secondaryTransparentColor!,
                                      spreadRadius: 1,
                                      blurRadius: 8,
                                      offset: const Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  clipBehavior: Clip.hardEdge,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          getProportionateScreenWidth(20)),
                                      child: Image.asset(
                                        'assets/images/bg.jpg',
                                        fit: BoxFit.cover,
                                        height: double.infinity,
                                      ),
                                    ),
                                    Positioned(
                                      right: -30,
                                      bottom: -20,
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        color: Colors.transparent,
                                        child: Image.asset(
                                          'assets/images/doctor_image.png',
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: getProportionateScreenHeight(10),
                                      left: getProportionateScreenHeight(22),
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Medical Checks!',
                                              style: TextStyle(
                                                  color: AppColors.lightBlack,
                                                  fontSize:
                                                      getProportionateScreenHeight(
                                                          18),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Check your health regularly to minimize the incidence of decease in the future',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                color: AppColors.darkGray,
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                top:
                                                    getProportionateScreenHeight(
                                                        5),
                                              ),
                                              width:
                                                  getProportionateScreenWidth(
                                                      95),
                                              height:
                                                  getProportionateScreenHeight(
                                                      30),
                                              decoration: BoxDecoration(
                                                color: themeProvider
                                                    .themeMode()
                                                    .themeColor,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      getProportionateScreenHeight(
                                                          5)),
                                                  topRight: Radius.circular(
                                                      getProportionateScreenHeight(
                                                          15)),
                                                  bottomLeft: Radius.circular(
                                                      getProportionateScreenHeight(
                                                          15)),
                                                  bottomRight: Radius.circular(
                                                      getProportionateScreenHeight(
                                                          15)),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: themeProvider
                                                        .themeMode()
                                                        .secondaryTransparentColor!,
                                                    spreadRadius: 1,
                                                    blurRadius: 2,
                                                    offset: const Offset(4, 4),
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.grey.shade300,
                                                    spreadRadius: 1,
                                                    blurRadius: 30,
                                                    offset: const Offset(-4, 4),
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Check now",
                                                  style: TextStyle(
                                                    color: themeProvider
                                                        .themeMode()
                                                        .primaryThemeColor,
                                                    fontSize:
                                                        getProportionateScreenHeight(
                                                            13),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(10),
                        ),
                        child: DotsIndicator(
                          position: state.page.toDouble(),
                          dotsCount: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          decorator: DotsDecorator(
                              color:
                                  themeProvider.themeMode().dotsIndicatorColor!,
                              size: const Size.square(8.0),
                              activeColor: themeProvider.themeMode().hmColor,
                              activeSize: const Size(22.0, 8.0),
                              spacing:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: themeProvider.themeMode().themeColor,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(260),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Padding(
                            padding:
                                EdgeInsets.all(getProportionateScreenHeight(5)),
                            child: Card(
                              elevation: 5.0,
                              color:
                                  themeProvider.themeMode().primaryThemeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenHeight(10)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: getProportionateScreenHeight(5),
                                      top: getProportionateScreenHeight(5),
                                      bottom: getProportionateScreenHeight(5),
                                    ),
                                    height: getProportionateScreenHeight(60),
                                    width: getProportionateScreenHeight(60),
                                    decoration: BoxDecoration(
                                      color:
                                          themeProvider.themeMode().cardColor,
                                      borderRadius: BorderRadius.circular(
                                          getProportionateScreenHeight(10)),
                                    ),
                                    child: Image.asset(
                                      'assets/icons/doctors.png',
                                      fit: BoxFit.cover,
                                      height: getProportionateScreenHeight(35),
                                      width: getProportionateScreenWidth(35),
                                    ),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(250),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'floor ${index + 1} (Specialist)',
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Handlee',
                                            color: themeProvider
                                                .themeMode()
                                                .themeColor,
                                          ),
                                        ),
                                        Text(
                                          '3 Rooms',
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Handlee',
                                            color: themeProvider
                                                .themeMode()
                                                .themeColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => ViewDoctorInformation(
                                        doctorId: 'Dr. John Rey ${index}')));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
  /*
                                  Container(
                                    height: getProportionateScreenHeight(150),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          child: Card(
                                            elevation: 5.0,
                                            color: Colors.grey,
                                            child: Container(
                                              height:
                                                  getProportionateScreenHeight(130),
                                              width:
                                                  getProportionateScreenHeight(130),
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/door.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Text(
                                                'Room $index',
                                                style: const TextStyle(
                                                  color: kPrimarySecondColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewDoctorInformation(
                                                            doctorId:
                                                                'Dr. John Rey ${index}')));
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  
                                  */
                                     
