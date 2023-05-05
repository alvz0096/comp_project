import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/size_config.dart';
import '../welcome_page/welcome/welcome.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Welcome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: getProportionateScreenWidth(150),
                height: getProportionateScreenHeight(225),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
