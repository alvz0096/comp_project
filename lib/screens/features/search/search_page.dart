import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/constant.dart';
import '../../../utils/size_config.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey.withOpacity(0.5),
                height: 1.0,
              ),
            ),
            elevation: 0,
            leading: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: themeProvider.themeMode().chatIconColor,
                )),
            title: Form(
              child: Container(
                height: getProportionateScreenHeight(50),
                width: getProportionateScreenWidth(double.infinity),
                decoration: BoxDecoration(
                    color: themeProvider.themeMode().cardColor,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(getProportionateScreenWidth(13)),
                    )),
                child: TextFormField(
                  style: TextStyle(fontSize: getProportionateScreenWidth(14)),
                  decoration: InputDecoration(
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
                    suffixIcon: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) {
                            return SizedBox(
                              height: 500,
                              child: Center(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.horizontal_rule_rounded,
                                      color:
                                          themeProvider.themeMode().themeColor,
                                      size: getProportionateScreenHeight(40),
                                    ),
                                    Text(
                                      'Filter',
                                      style: TextStyle(
                                        color: themeProvider
                                            .themeMode()
                                            .themeColor,
                                        fontSize:
                                            getProportionateScreenHeight(25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(14)),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          'assets/icons/filter_icon.png',
                          color: themeProvider.themeMode().themeColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
