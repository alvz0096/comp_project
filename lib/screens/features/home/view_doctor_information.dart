import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/size_config.dart';

class ViewDoctorInformation extends StatelessWidget {
  const ViewDoctorInformation({super.key, required this.doctorId});
  final String doctorId;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(1.0),
                  child: Container(
                    color: Colors.grey[300],
                    height: 1.0,
                  ),
                ),
                title: Text(
                  'Dr. John Rey Alvarez',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Handlee',
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      const show = SnackBar(
                        content: Text('Added to favorite'),
                        duration: Duration(seconds: 2),
                        elevation: 2.0,
                        behavior: SnackBarBehavior.floating,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(show);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(10)),
                      height: getProportionateScreenHeight(25),
                      width: getProportionateScreenWidth(25),
                      child: Image.asset('assets/icons/heart_outlined.png'),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(right: getProportionateScreenWidth(10)),
                    height: getProportionateScreenHeight(25),
                    width: getProportionateScreenWidth(25),
                    child: Image.asset('assets/icons/more_outlined.png'),
                  ),
                ],
                iconTheme: const IconThemeData(color: Colors.black),
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop())),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(20)),
                      child: Column(
                        children: [
                          // first content of doctors info
                          Container(
                            height: getProportionateScreenHeight(180),
                            padding: EdgeInsets.all(
                                getProportionateScreenHeight(10)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(25)),
                              color: kCardColor,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(
                                      double.infinity),
                                  width: getProportionateScreenWidth(130),
                                  margin: EdgeInsets.all(
                                    getProportionateScreenHeight(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(25)),
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(
                                      getProportionateScreenHeight(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '$doctorId',
                                          style: TextStyle(
                                            fontFamily: 'Handlee',
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    17),
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Divider(
                                          color: Color(0xFF0D0F25),
                                          thickness: 2,
                                        ),
                                        Text(
                                          'Immunologists',
                                          style: TextStyle(
                                            fontFamily: 'Handlee',
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    12),
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.transparent,
                                          thickness: 2,
                                        ),
                                        Text(
                                          'EVRMC in Tacloban City',
                                          style: TextStyle(
                                            fontFamily: 'Handlee',
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    12),
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Icons Section
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(15)),
                            width: getProportionateScreenWidth(double.infinity),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom:
                                              getProportionateScreenHeight(10)),
                                      width: getProportionateScreenWidth(55),
                                      height: getProportionateScreenHeight(55),
                                      decoration: BoxDecoration(
                                        color: kIconBGColor,
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenHeight(27.5)),
                                      ),
                                      child: SizedBox(
                                        width:
                                            getProportionateScreenWidth(27.5),
                                        height:
                                            getProportionateScreenHeight(27.5),
                                        child: Icon(
                                          Icons.groups_rounded,
                                          color: kIconColor,
                                          size: getProportionateScreenHeight(
                                              27.5),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '4,000+',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Handlee',
                                        fontSize:
                                            getProportionateScreenHeight(17),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                    Text(
                                      'patients',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Handlee',
                                        fontSize:
                                            getProportionateScreenHeight(14),
                                      ),
                                    )
                                  ]),
                                ),
                                Expanded(
                                  child: Column(children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom:
                                              getProportionateScreenHeight(10)),
                                      width: getProportionateScreenWidth(55),
                                      height: getProportionateScreenHeight(55),
                                      decoration: BoxDecoration(
                                        color: kIconBGColor,
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenHeight(27.5)),
                                      ),
                                      child: SizedBox(
                                        width:
                                            getProportionateScreenWidth(27.5),
                                        height:
                                            getProportionateScreenHeight(27.5),
                                        child: Icon(
                                          Icons.auto_graph_outlined,
                                          color: kIconColor,
                                          size: getProportionateScreenHeight(
                                              27.5),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '10+',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Handlee',
                                        fontSize:
                                            getProportionateScreenHeight(17),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                    Text(
                                      'years experie...',
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Handlee',
                                        fontSize:
                                            getProportionateScreenHeight(14),
                                      ),
                                    ),
                                  ]),
                                ),
                                Expanded(
                                  child: Column(children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom:
                                              getProportionateScreenHeight(10)),
                                      width: getProportionateScreenWidth(55),
                                      height: getProportionateScreenHeight(55),
                                      decoration: BoxDecoration(
                                        color: kIconBGColor,
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenHeight(27.5)),
                                      ),
                                      child: SizedBox(
                                        width:
                                            getProportionateScreenWidth(27.5),
                                        height:
                                            getProportionateScreenHeight(27.5),
                                        child: Icon(
                                          Icons.star_half_rounded,
                                          color: kIconColor,
                                          size: getProportionateScreenHeight(
                                              27.5),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '4.8',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Handlee',
                                        fontSize:
                                            getProportionateScreenHeight(17),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                    Text(
                                      'rating',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Handlee',
                                        fontSize:
                                            getProportionateScreenHeight(14),
                                      ),
                                    )
                                  ]),
                                ),
                                Expanded(
                                  child: Column(children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom:
                                              getProportionateScreenHeight(10)),
                                      width: getProportionateScreenWidth(55),
                                      height: getProportionateScreenHeight(55),
                                      decoration: BoxDecoration(
                                        color: kIconBGColor,
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenHeight(27.5)),
                                      ),
                                      child: SizedBox(
                                        width:
                                            getProportionateScreenWidth(27.5),
                                        height:
                                            getProportionateScreenHeight(27.5),
                                        child: Icon(
                                          Icons.message_outlined,
                                          color: kIconColor,
                                          size: getProportionateScreenHeight(
                                              27.5),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '4,942',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Handlee',
                                        fontSize:
                                            getProportionateScreenHeight(17),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                    Text(
                                      'reviews',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Handlee',
                                        fontSize:
                                            getProportionateScreenHeight(14),
                                      ),
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ),
                          // Description Section about doctor
                          Container(
                            margin: EdgeInsets.only(
                                top: getProportionateScreenHeight(15)),
                            width: getProportionateScreenWidth(double.infinity),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About Me',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenHeight(19),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Handlee',
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Text(
                                  kString,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenHeight(15),
                                    fontFamily: 'Handlee',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Schedule Section of doctor
                          Container(
                            margin: EdgeInsets.only(
                                top: getProportionateScreenHeight(15)),
                            width: getProportionateScreenWidth(double.infinity),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Working Time',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenHeight(19),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Handlee',
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Text(
                                  'Monday - Friday. 8:00 AM - 8:00 PM',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenHeight(15),
                                    fontFamily: 'Handlee',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Reviews Section
                          Container(
                            margin: EdgeInsets.only(
                                top: getProportionateScreenHeight(15)),
                            width: getProportionateScreenWidth(double.infinity),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Reviews',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenHeight(19),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Handlee',
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Text(
                                  'See All',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: kIconColor,
                                    fontSize: getProportionateScreenHeight(19),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Handlee',
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            height: getProportionateScreenHeight(250),
                            padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(15)),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenHeight(10)),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              50),
                                                      width:
                                                          getProportionateScreenWidth(
                                                              50),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getProportionateScreenWidth(
                                                                    20)),
                                                        child: Image.asset(
                                                          'assets/images/logo.png',
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          getProportionateScreenWidth(
                                                              10),
                                                    ),
                                                    Text(
                                                      'Steven Edward Copada',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            getProportionateScreenHeight(
                                                                15),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Handlee',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              30),
                                                      width:
                                                          getProportionateScreenWidth(
                                                              65),
                                                      child: Container(
                                                        width:
                                                            getProportionateScreenHeight(
                                                                100),
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color:
                                                                      kIconColor,
                                                                  width:
                                                                      getProportionateScreenHeight(
                                                                          1.5),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            getProportionateScreenHeight(15))),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color: kIconColor,
                                                              size:
                                                                  getProportionateScreenHeight(
                                                                      16),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  getProportionateScreenWidth(
                                                                      7),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: getProportionateScreenHeight(
                                                                          3.3)),
                                                              child: Text(
                                                                '5',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      kIconColor,
                                                                  fontSize:
                                                                      getProportionateScreenHeight(
                                                                          15),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Handlee',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left:
                                                              getProportionateScreenWidth(
                                                                  10)),
                                                      height:
                                                          getProportionateScreenHeight(
                                                              23),
                                                      width:
                                                          getProportionateScreenWidth(
                                                              23),
                                                      child: Image.asset(
                                                          'assets/icons/more_outlined.png'),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                getProportionateScreenHeight(
                                                    10),
                                          ),
                                          Text(
                                            kString,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  getProportionateScreenHeight(
                                                      15),
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Handlee',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(40)),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: getProportionateScreenHeight(5),
                    left: getProportionateScreenHeight(20),
                    right: getProportionateScreenHeight(20),
                    child: Container(
                      height: getProportionateScreenHeight(55),
                      width: getProportionateScreenWidth(double.infinity),
                      decoration: BoxDecoration(
                          gradient: kPrimaryGradientColor,
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(15))),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        child: Text(
                          'Book Appoinment',
                          style: TextStyle(
                            color: kPrimaryLightColor,
                            fontSize: getProportionateScreenHeight(15),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Handlee',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
