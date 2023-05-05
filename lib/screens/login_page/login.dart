import 'package:comp_project/screens/login_page/widgets/login_widget.dart';
import 'package:comp_project/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;

  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

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
            //appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  margin:
                      EdgeInsets.only(top: getProportionateScreenHeight(100)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildContainer(themeProvider),
                      Form(
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
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(14)),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    label: Text(
                                      'Email',
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenHeight(15),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            getProportionateScreenHeight(10)),
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: themeProvider
                                              .themeMode()
                                              .secondaryThemeColor!,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenWidth(13))),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(width: 2.0),
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenWidth(13))),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                        top: getProportionateScreenHeight(10),
                                        bottom:
                                            getProportionateScreenHeight(10),
                                      ),
                                      child: SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                        width: getProportionateScreenWidth(10),
                                        child: const Icon(
                                            Icons.mail_lock_outlined),
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
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(14)),
                                  obscureText: _passwordVisible ? false : true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    label: Text(
                                      'Password',
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenHeight(15),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: themeProvider
                                              .themeMode()
                                              .secondaryThemeColor!,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenWidth(13))),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          getProportionateScreenWidth(13)),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            getProportionateScreenHeight(10)),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                        top: getProportionateScreenHeight(10),
                                        bottom:
                                            getProportionateScreenHeight(10),
                                      ),
                                      child: const Icon(
                                          Icons.lock_outline_rounded),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        _toggle();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: getProportionateScreenHeight(10),
                                          bottom:
                                              getProportionateScreenHeight(10),
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
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      buildForgotPasswordButton(
                          'Forgot Password', themeProvider),
                      buildLoginButton(context, themeProvider),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      buildCreateAccountButton(
                          'Don\'t have an account yet? Sign-up here',
                          themeProvider)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
