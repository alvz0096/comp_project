import 'package:comp_project/screens/features/receptionist/receptionist_chat/receptionist_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/size_config.dart';

class ReceptionistPage extends StatefulWidget {
  const ReceptionistPage({super.key});

  @override
  State<ReceptionistPage> createState() => _ReceptionistPageState();
}

class _ReceptionistPageState extends State<ReceptionistPage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Container(
        color: themeProvider.themeMode().containerColor,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(1.0),
                  child: Container(
                    color: Colors.grey.withOpacity(0.5),
                    height: 1.0,
                  ),
                ),
                title: Text(
                  'Happy Med Agent',
                  style: TextStyle(
                    color: themeProvider.themeMode().themeColor,
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                actions: [
                  Container(
                    margin:
                        EdgeInsets.only(right: getProportionateScreenWidth(10)),
                    height: getProportionateScreenHeight(25),
                    width: getProportionateScreenWidth(25),
                    child: Image.asset(
                      'assets/icons/help_icon.png',
                      color: themeProvider.themeMode().themeColor,
                    ),
                  ),
                ],
                iconTheme:
                    IconThemeData(color: themeProvider.themeMode().themeColor),
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop())),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenHeight(15)),
                width: double.infinity,
                color: themeProvider.themeMode().containerColor,
                child: Column(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(100),
                      width: getProportionateScreenWidth(double.infinity),
                      decoration: BoxDecoration(
                        color: themeProvider.themeMode().boxContainerColor,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenHeight(10),
                        ),
                      ),
                      //Note Section
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Attention',
                                style: TextStyle(
                                  color: themeProvider.themeMode().themeColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(16),
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(3),
                              ),
                              Icon(
                                Icons.info_outline,
                                color: themeProvider.themeMode().themeColor,
                                size: getProportionateScreenHeight(20),
                              ),
                            ],
                          ),
                          Text(
                            'If you have any query, direct to our tables where the receptionist is assigned.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  themeProvider.themeMode().primaryContentColor,
                              fontWeight: FontWeight.normal,
                              fontSize: getProportionateScreenHeight(14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: getProportionateScreenHeight(10),
                        ),
                        child: SizedBox(
                          width: getProportionateScreenWidth(355),
                          height: getProportionateScreenHeight(550),
                          child: GridView.count(
                            crossAxisCount: 3,
                            children: List.generate(
                              5,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                ReceptionistChatPage(
                                                    receptionistId:
                                                        '${index + 1}')));
                                  },
                                  child: Center(
                                    child: Container(
                                      width: getProportionateScreenHeight(100),
                                      height: getProportionateScreenHeight(100),
                                      decoration: BoxDecoration(
                                        color:
                                            themeProvider.themeMode().hmColor,
                                        borderRadius: BorderRadius.circular(
                                          getProportionateScreenHeight(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: themeProvider
                                                .themeMode()
                                                .secondaryTransparentColor!,
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            offset: const Offset(5, 5),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/receptionist.png',
                                            fit: BoxFit.cover,
                                            height:
                                                getProportionateScreenHeight(
                                                    55),
                                            width:
                                                getProportionateScreenWidth(55),
                                          ),
                                          Text(
                                            'Table ${index + 1}',
                                            style: TextStyle(
                                              color: themeProvider
                                                  .themeMode()
                                                  .primaryThemeColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  getProportionateScreenHeight(
                                                      14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
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
      ),
    );
  }
}
