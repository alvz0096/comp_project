import 'package:comp_project/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_theme.dart';
import '../nav_page/nav_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    SizeConfig().init(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Container(
        color: themeProvider.themeMode().primaryThemeColor,
        child: SafeArea(
          child: Scaffold(
            body: buildPages(_index),
            bottomNavigationBar: Container(
              width: getProportionateScreenWidth(375),
              height: getProportionateScreenHeight(68),
              decoration: BoxDecoration(
                color: themeProvider.themeMode().tertiaryThemeColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getProportionateScreenHeight(20)),
                  topRight: Radius.circular(getProportionateScreenHeight(20)),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: themeProvider.themeMode().tertiaryThemeColor,
                currentIndex: _index,
                onTap: (value) {
                  setState(() {
                    _index = value;
                  });
                },
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: themeProvider.themeMode().hmColor,
                unselectedItemColor:
                    themeProvider.themeMode().secondaryThemeColor,
                items: [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: SizedBox(
                      width: getProportionateScreenWidth(18),
                      height: getProportionateScreenHeight(18),
                      child: Image.asset('assets/icons/home_icon.png',
                          color: themeProvider.themeMode().secondaryThemeColor),
                    ),
                    activeIcon: SizedBox(
                      width: getProportionateScreenWidth(20),
                      height: getProportionateScreenHeight(20),
                      child: Image.asset(
                        'assets/icons/home_icon.png',
                        color: themeProvider.themeMode().hmColor,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Appointme...',
                    icon: SizedBox(
                      width: getProportionateScreenWidth(18),
                      height: getProportionateScreenHeight(18),
                      child: Image.asset('assets/icons/appointment_icon.png',
                          color: themeProvider.themeMode().secondaryThemeColor),
                    ),
                    activeIcon: SizedBox(
                      width: getProportionateScreenWidth(20),
                      height: getProportionateScreenHeight(20),
                      child: Image.asset(
                        'assets/icons/appointment_icon.png',
                        color: themeProvider.themeMode().hmColor,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Chats',
                    icon: SizedBox(
                      width: getProportionateScreenWidth(18),
                      height: getProportionateScreenHeight(18),
                      child: Image.asset('assets/icons/chat_icon.png',
                          color: themeProvider.themeMode().secondaryThemeColor),
                    ),
                    activeIcon: SizedBox(
                      width: getProportionateScreenWidth(20),
                      height: getProportionateScreenHeight(20),
                      child: Image.asset(
                        'assets/icons/chat_icon.png',
                        color: themeProvider.themeMode().hmColor,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Drug Store',
                    icon: SizedBox(
                      width: getProportionateScreenWidth(22),
                      height: getProportionateScreenHeight(22),
                      child: Image.asset('assets/icons/cart_icon.png',
                          color: themeProvider.themeMode().secondaryThemeColor),
                    ),
                    activeIcon: SizedBox(
                      width: getProportionateScreenWidth(24),
                      height: getProportionateScreenHeight(24),
                      child: Image.asset(
                        'assets/icons/cart_icon.png',
                        color: themeProvider.themeMode().hmColor,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: SizedBox(
                      width: getProportionateScreenWidth(18),
                      height: getProportionateScreenHeight(18),
                      child: Image.asset('assets/icons/user_icon.png',
                          color: themeProvider.themeMode().secondaryThemeColor),
                    ),
                    activeIcon: SizedBox(
                      width: getProportionateScreenWidth(20),
                      height: getProportionateScreenHeight(20),
                      child: Image.asset(
                        'assets/icons/user_icon.png',
                        color: themeProvider.themeMode().hmColor,
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
