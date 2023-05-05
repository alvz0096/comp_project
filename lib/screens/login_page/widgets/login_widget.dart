import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/size_config.dart';
import '../../Features/Home/home_page.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1.0,
      ),
    ),
    title: Text(
      'Login',
      style: TextStyle(
        color: Colors.black,
        fontSize: getProportionateScreenHeight(16),
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildContainer(ThemeProvider themeProvider) {
  return SizedBox(
    height: getProportionateScreenHeight(200),
    width: getProportionateScreenWidth(325),
    child: Column(
      children: [
        Text(
          'Welcome to',
          style: TextStyle(
              fontSize: getProportionateScreenHeight(17),
              fontWeight: FontWeight.normal,
              color: themeProvider.themeMode().themeColor),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(50),
                  right: getProportionateScreenWidth(10)),
              child: Image.asset(
                'assets/images/logo.png',
                height: getProportionateScreenHeight(63),
                width: getProportionateScreenWidth(63),
              ),
            ),
            Text(
              'Happy Med',
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(27),
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeMode().hmColor),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(60),
        ),
        Container(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(37)),
          height: getProportionateScreenHeight(50),
          width: getProportionateScreenWidth(325),
          child: Text(
            'Sign-in using your login credentials',
            style: TextStyle(
                fontSize: getProportionateScreenHeight(15),
                fontWeight: FontWeight.normal,
                color: themeProvider.themeMode().hmColor),
          ),
        ),
      ],
    ),
  );
}

Widget reusableText(String text, ThemeProvider themeProvider) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.black45,
      fontSize: getProportionateScreenHeight(14),
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget buildFormTextField(
  BuildContext context,
  ThemeProvider themeProvider,
  bool _passwordVisible,
  Function? callback,
) {
  return Form(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: getProportionateScreenHeight(9),
              bottom: getProportionateScreenHeight(16)),
          child: SizedBox(
            height: getProportionateScreenHeight(50),
            width: getProportionateScreenWidth(325),
            child: TextFormField(
              style: TextStyle(fontSize: getProportionateScreenWidth(14)),
              decoration: InputDecoration(
                isDense: true,
                label: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(17),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10)),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: themeProvider.themeMode().secondaryThemeColor!,
                    ),
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(13))),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2.0),
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(13))),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(10),
                    bottom: getProportionateScreenHeight(10),
                  ),
                  child: SizedBox(
                    height: getProportionateScreenHeight(10),
                    width: getProportionateScreenWidth(10),
                    child: const Icon(Icons.mail_lock_outlined),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: getProportionateScreenHeight(9),
              bottom: getProportionateScreenHeight(16)),
          child: SizedBox(
            height: getProportionateScreenHeight(50),
            width: getProportionateScreenWidth(325),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: getProportionateScreenWidth(14)),
              obscureText: true,
              decoration: InputDecoration(
                isDense: true,
                label: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(17),
                    fontFamily: 'Handlee',
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: themeProvider.themeMode().secondaryThemeColor!,
                    ),
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(13))),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenWidth(13)),
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10)),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(10),
                    bottom: getProportionateScreenHeight(10),
                  ),
                  child: const Icon(Icons.lock_outline_rounded),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    callback;
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: getProportionateScreenHeight(10),
                      bottom: getProportionateScreenHeight(10),
                    ),
                    child: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildTextField(
    String text, String imagePath, ThemeProvider themeProvider) {
  return Container(
    width: getProportionateScreenWidth(325),
    height: getProportionateScreenHeight(50),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.all(
          Radius.circular(getProportionateScreenWidth(10)),
        )),
    child: Row(
      children: [
        Container(
          width: getProportionateScreenWidth(16),
          height: getProportionateScreenHeight(16),
          margin: EdgeInsets.only(left: getProportionateScreenWidth(17)),
          child: Image.asset(imagePath),
        ),
        SizedBox(
          width: getProportionateScreenWidth(270),
          height: getProportionateScreenHeight(50),
          child: TextField(
            onChanged: (text) {},
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: text,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: getProportionateScreenWidth(14),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildForgotPasswordButton(String text, ThemeProvider themeProvider) {
  return Text(
    text,
    style: TextStyle(
      color: themeProvider.themeMode().hmColor,
      fontSize: getProportionateScreenHeight(15),
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget buildLoginButton(BuildContext context, ThemeProvider themeProvider) {
  return Container(
    margin: EdgeInsets.only(
      top: getProportionateScreenHeight(10),
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
        Icon(
          CupertinoIcons.arrow_right,
          color: themeProvider.themeMode().hmColor,
        ),
        Text(
          'Login',
          style: TextStyle(
            color: themeProvider.themeMode().hmColor,
            fontSize: getProportionateScreenHeight(16),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget buildCreateAccountButton(String text, ThemeProvider themeProvider) {
  return Container(
    width: getProportionateScreenWidth(325),
    height: getProportionateScreenHeight(60),
    padding: EdgeInsets.only(left: getProportionateScreenWidth(25)),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: getProportionateScreenHeight(15),
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
