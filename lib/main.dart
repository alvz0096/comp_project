import 'package:comp_project/screens/features/landing_screen/landing_page.dart';
import 'package:comp_project/screens/login_page/login.dart';
import 'package:comp_project/screens/welcome_page/bloc/welcome_blocs.dart';
import 'package:comp_project/utils/app_theme.dart';
import 'package:comp_project/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/features/nav_page/bloc/corousel_bloc.dart';
import 'screens/splash_page/splash_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLightTheme = prefs.getBool(SPref.isLight) ?? true;
  runApp(AppStart(
    isLightTheme: isLightTheme,
  ));
}

class AppStart extends StatelessWidget {
  const AppStart({super.key, required this.isLightTheme});
  final bool isLightTheme;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => CorouselBloc(),
        )
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => ThemeProvider(isLightTheme: isLightTheme)),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String fontFamily = "Handlee";

  /*
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        getWindow().addFlags(LayoutParams.FLAG_SECURE);
    }
    */

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeProvider.themeData(),
      home: const SplashScreen(),
      routes: {
        "loginPage": (context) => const Login(),
        "landingPage": (context) => const LandingPage(),
      },
    );
  }
}
