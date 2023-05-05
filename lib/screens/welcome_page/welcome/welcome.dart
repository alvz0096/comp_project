import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/size_config.dart';
import '../bloc/welcome_blocs.dart';
import '../bloc/welcome_events.dart';
import '../bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    SizeConfig().init(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Container(
        color: themeProvider.themeMode().containerColor,
        child: SafeArea(
          child: Scaffold(
            body: BlocBuilder<WelcomeBloc, WelcomeState>(
              builder: (context, state) {
                return Container(
                  margin:
                      EdgeInsets.only(top: getProportionateScreenHeight(43)),
                  width: getProportionateScreenWidth(375),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      PageView(
                        controller: pageController,
                        onPageChanged: (index) {
                          state.page = index;
                          BlocProvider.of<WelcomeBloc>(context)
                              .add(WelcomeEvent());
                          //print('index value: ${index}');
                        },
                        children: [
                          _page(
                            1,
                            context,
                            'Next',
                            'Fast Service',
                            'Fast service consultation allows patients to consult with a doctor quickly and easily.',
                            'assets/images/png_s1.png',
                            themeProvider,
                          ),
                          _page(
                            2,
                            context,
                            'Next',
                            'Online consultation',
                            ' Learn about how phone and chat consultations can help you receive medical advice.',
                            'assets/images/png_s2.png',
                            themeProvider,
                          ),
                          _page(
                            3,
                            context,
                            'Get Started',
                            'Buy Online at Drug Store',
                            'Buying medicine online at a drug store can be a convenient and time-saving option.',
                            'assets/images/delivery_boy.png',
                            themeProvider,
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: getProportionateScreenHeight(80),
                        child: DotsIndicator(
                          position: state.page.toDouble(),
                          dotsCount: 3,
                          mainAxisAlignment: MainAxisAlignment.center,
                          decorator: DotsDecorator(
                              color:
                                  themeProvider.themeMode().dotsIndicatorColor!,
                              size: const Size.square(8.0),
                              activeColor: themeProvider.themeMode().hmColor,
                              activeSize: const Size(18.0, 8.0),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath, ThemeProvider themeProvider) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenHeight(330),
          height: getProportionateScreenHeight(330),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: themeProvider.themeMode().themeColor!,
              fontSize: getProportionateScreenHeight(25),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Container(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(30),
            right: getProportionateScreenWidth(30),
          ),
          child: Text(
            subTitle,
            style: TextStyle(
              color: themeProvider.themeMode().contentColor!,
              fontSize: getProportionateScreenWidth(19),
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Container(
          child: getButton(index, buttonName, themeProvider),
        ),
      ],
    );
  }

  Widget getButton(int index, String buttonName, ThemeProvider themeProvider) {
    return GestureDetector(
      onTap: () {
        if (index < 3) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
          );
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("landingPage", (route) => false);
        }
      },
      child: Container(
        margin: EdgeInsets.only(
          top: getProportionateScreenHeight(80),
        ),
        width: getProportionateScreenWidth(325),
        height: getProportionateScreenHeight(60),
        decoration: BoxDecoration(
          color: themeProvider.themeMode().primaryThemeColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getProportionateScreenHeight(5)),
            topRight: Radius.circular(getProportionateScreenHeight(25)),
            bottomLeft: Radius.circular(getProportionateScreenHeight(25)),
            bottomRight: Radius.circular(getProportionateScreenHeight(25)),
          ),
          boxShadow: [
            BoxShadow(
              color: themeProvider.themeMode().hmColor!,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (index < 3)
                ? const Text(
                    '',
                  )
                : Icon(
                    CupertinoIcons.arrow_right,
                    color: themeProvider.themeMode().hmColor,
                  ),
            Text(
              buttonName,
              style: TextStyle(
                color: themeProvider.themeMode().hmColor,
                fontSize: getProportionateScreenHeight(16),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
    /*
      return Container(
        margin: EdgeInsets.only(
          top: getProportionateScreenHeight(80),
        ),
        width: getProportionateScreenWidth(325),
        height: getProportionateScreenHeight(60),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("landingPage", (route) => false);
          },
          icon: Icon(
            CupertinoIcons.arrow_right,
            color: themeProvider.themeMode().primaryThemeColor,
          ),
          label: Text(
            buttonName,
            style: TextStyle(
              color: themeProvider.themeMode().primaryThemeColor,
              fontSize: getProportionateScreenHeight(16),
              fontWeight: FontWeight.normal,
            ),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize:
                Size(double.infinity, getProportionateScreenHeight(47)),
            backgroundColor: themeProvider.themeMode().chatIconColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getProportionateScreenHeight(5)),
                topRight: Radius.circular(getProportionateScreenHeight(25)),
                bottomLeft: Radius.circular(getProportionateScreenHeight(25)),
                bottomRight: Radius.circular(getProportionateScreenHeight(25)),
              ),
            ),
          ),
        ),
      );
      */
  }
}
