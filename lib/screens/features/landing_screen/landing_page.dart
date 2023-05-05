import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/size_config.dart';
import '../../login_page/login.dart';
import '../Home/home_page.dart';
import '../receptionist/receptionist_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    SizeConfig().init(context);
    return Container(
      color: themeProvider.themeMode().containerColor,
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: getProportionateScreenWidth(double.infinity),
            height: getProportionateScreenHeight(double.infinity),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/images/landing_bg.png',
                  fit: BoxFit.cover,
                  width: getProportionateScreenWidth(double.infinity),
                  height: getProportionateScreenHeight(double.infinity),
                ),
                ClipRRect(
                  // Clip it cleanly.
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.grey.withOpacity(0.1),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    margin:
                        EdgeInsets.only(top: getProportionateScreenHeight(80)),
                    height: getProportionateScreenHeight(400),
                    width: getProportionateScreenWidth(295),
                    // Buttons Section
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ReceptionistPage()),
                            );
                          },
                          child: Container(
                            height: getProportionateScreenHeight(85),
                            width: getProportionateScreenWidth(285),
                            margin: EdgeInsets.only(
                              top: getProportionateScreenHeight(15),
                            ),
                            padding: EdgeInsets.all(
                              getProportionateScreenHeight(10),
                            ),
                            decoration: BoxDecoration(
                              color:
                                  themeProvider.themeMode().primaryThemeColor,
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 2,
                                  blurRadius: 30,
                                  offset: const Offset(-4, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/receptionist.png',
                                  fit: BoxFit.cover,
                                  height: getProportionateScreenHeight(55),
                                  width: getProportionateScreenWidth(55),
                                ),
                                Expanded(
                                  child: VerticalDivider(
                                    color: themeProvider.themeMode().themeColor,
                                    thickness: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(55),
                                  width: getProportionateScreenWidth(200),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Go to',
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    12),
                                            fontWeight: FontWeight.normal,
                                            color: themeProvider
                                                .themeMode()
                                                .secondaryThemeColor),
                                      ),
                                      Text(
                                        'RECEPTIONIST',
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    14.5),
                                            fontWeight: FontWeight.bold,
                                            color: themeProvider
                                                .themeMode()
                                                .themeColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Login()));
                          },
                          child: Container(
                            height: getProportionateScreenHeight(85),
                            width: getProportionateScreenWidth(285),
                            margin: EdgeInsets.only(
                              top: getProportionateScreenHeight(58.5),
                            ),
                            padding: EdgeInsets.all(
                              getProportionateScreenHeight(10),
                            ),
                            decoration: BoxDecoration(
                              color:
                                  themeProvider.themeMode().primaryThemeColor,
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 2,
                                  blurRadius: 30,
                                  offset: const Offset(-4, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/room.png',
                                  fit: BoxFit.cover,
                                  height: getProportionateScreenHeight(55),
                                  width: getProportionateScreenWidth(55),
                                ),
                                Expanded(
                                  child: VerticalDivider(
                                    color: themeProvider.themeMode().themeColor,
                                    thickness: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(55),
                                  width: getProportionateScreenWidth(200),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Go to',
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    12),
                                            fontWeight: FontWeight.normal,
                                            color: themeProvider
                                                .themeMode()
                                                .lineColor),
                                      ),
                                      Text(
                                        'ROOM',
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    13.5),
                                            fontWeight: FontWeight.bold,
                                            color: themeProvider
                                                .themeMode()
                                                .themeColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          },
                          child: Container(
                            height: getProportionateScreenHeight(85),
                            width: getProportionateScreenWidth(285),
                            margin: EdgeInsets.only(
                              top: getProportionateScreenHeight(58.5),
                            ),
                            padding: EdgeInsets.all(
                              getProportionateScreenHeight(10),
                            ),
                            decoration: BoxDecoration(
                              color:
                                  themeProvider.themeMode().primaryThemeColor,
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenHeight(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 2,
                                  blurRadius: 30,
                                  offset: const Offset(-4, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/lounge.png',
                                  fit: BoxFit.cover,
                                  height: getProportionateScreenHeight(55),
                                  width: getProportionateScreenWidth(55),
                                ),
                                Expanded(
                                  child: VerticalDivider(
                                    color: themeProvider.themeMode().lineColor,
                                    thickness: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(55),
                                  width: getProportionateScreenWidth(200),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Go to',
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    12),
                                            fontWeight: FontWeight.normal,
                                            color: themeProvider
                                                .themeMode()
                                                .lineColor),
                                      ),
                                      Text(
                                        'LOUNGE',
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    13.5),
                                            fontWeight: FontWeight.bold,
                                            color: themeProvider
                                                .themeMode()
                                                .themeColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
