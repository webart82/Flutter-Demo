import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/example/api_data.dart';
import 'package:flutterbeginner/view/example/bothside_nav_drawer.dart';
import 'package:flutterbeginner/view/example/bottom_navigation.dart';
import 'package:flutterbeginner/view/example/calculator_app.dart';
import 'package:flutterbeginner/view/example/chat_app.dart';
import 'package:flutterbeginner/view/example/listview_pagination.dart';
import 'package:flutterbeginner/view/example/local_jsondata.dart';
import 'package:flutterbeginner/view/example/login_page.dart';
import 'package:flutterbeginner/view/example/nav_drawer.dart';
import 'package:flutterbeginner/view/example/permission_helper.dart';
import 'package:flutterbeginner/view/example/sp_screen.dart';
import 'package:flutterbeginner/view/example/stepper_view.dart';
import 'package:flutterbeginner/view/example/tab_bar.dart';
import 'package:flutterbeginner/view/github/github_users.dart';
import 'package:flutterbeginner/view/sqflite/sqflite_login.dart';
import 'package:flutterbeginner/view/sqflite/sqflite_onboarding.dart';
import 'package:flutterbeginner/view/sqflite/sqflite_splash.dart';
import 'package:flutterbeginner/view/widgets/button_widget.dart';
import 'package:flutterbeginner/view/widgets/image_widget.dart';
import 'package:flutterbeginner/view/widgets/misc_widget.dart';
import 'package:flutterbeginner/view/widgets/progress_bar_widget.dart';
import 'package:flutterbeginner/view/widgets/text_field_widget.dart';
import 'package:flutterbeginner/view/widgets/text_widget.dart';

class ALLTask extends StatelessWidget {
  final List<String> allTaskBean = new List();

  @override
  Widget build(BuildContext context) {
    setData();
    return new Scaffold(
      appBar: getAppBar(context, StringConst.FLUTTER_DEMO_TITLE),
      body: _createUi(),
    );
  }

  Widget _createUi() {
    return new Container(
        child: new ListView.builder(
            itemCount: allTaskBean == null ? 0 : allTaskBean.length,
            itemBuilder: (BuildContext context, int index) {
              return taskRow(context, allTaskBean[index]);
            }));
  }

  Widget taskRow(BuildContext context, String screenName) {
    return GestureDetector(
      onTap: () {
        nextScreen(context, screenName);
      },
      child: new Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 5),
          child: new Row(
            children: <Widget>[
              CircleAvatar(
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  radius: 35.0,
                  child: getTxtWhiteColor(
                      screenName[0].toUpperCase(), 28, FontWeight.bold)),
              Padding(padding: EdgeInsets.only(left: 8)),
              Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    getTxtBlackColor(screenName, 16, FontWeight.bold),
                    getTxtGreyColor(StringConst.DUMMY_TEXT, 15, null),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> setData() {
    allTaskBean.add("Text");
    allTaskBean.add("Text Field");
    allTaskBean.add("Image View");
    allTaskBean.add("Button");
    allTaskBean.add("Progress Bar");
    allTaskBean.add("Misc Widget");
    allTaskBean.add("Login screen");
    allTaskBean.add("Read local file JSON");
    allTaskBean.add("Chat app screen");
    allTaskBean.add("Calculator");
    allTaskBean.add("ListView Pagination");
    allTaskBean.add("API Call");
    allTaskBean.add("GitHub");
    allTaskBean.add("Navigation drawer");
    allTaskBean.add("BothSide Navigation drawer");
    allTaskBean.add('Stepper');
    allTaskBean.add('Bottom Navigation');
    allTaskBean.add('Tab Bar');
    allTaskBean.add('Sqflite');
    allTaskBean.add('Shared preference');
    allTaskBean.add('OnBoarding');
    allTaskBean.add('Splash');
    allTaskBean.add('Run time permission');
    allTaskBean.add('Swipe to delete');
    return allTaskBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case "Text":
        return navigationPush(context, TextWidget());
      case "Text Field":
        return navigationPush(context, TextFieldWidget());
      case "Image View":
        return navigationPush(context, ImageWidget());
      case "Button":
        return navigationPush(context, ButtonWidget());
      case "Progress Bar":
        return navigationPush(context, ProgressBarWidget());
      case "Misc Widget":
        return navigationPush(context, MiscWidget());
      case "Login screen":
        return navigationPush(context, LoginScreen());
      case "Read local file JSON":
        return navigationPush(context, LocalData());
      case "Chat app screen":
        return navigationPush(context, ChatScreen());
      case "Calculator":
        return navigationPush(context, CalculatorApp());
      case "ListView Pagination":
        return navigationPush(context, LVPagination());
      case "API Call":
        return navigationPush(context, ApiScreen());
      case "GitHub":
        return navigationPush(context, GitUsers());
      case "Navigation drawer":
        return navigationPush(context, NavigationDrawerScreen());
      case "BothSide Navigation drawer":
        return navigationPush(context, BothSideNavDrawerScreen());
      case 'Stepper':
        return navigationPush(context, StepperView());
      case 'Bottom Navigation':
        return navigationPush(context, BottomNavScreen());
      case 'Tab Bar':
        return navigationPush(context, TabBarScreen());
      case 'Sqflite':
        return navigationPush(context, SqfliteLogin());
      case 'Shared preference':
        return navigationPush(context, SPScreen());
      case 'OnBoarding':
        return navigationPush(context, OnboardingScreen());
      case 'Splash':
        return navigationPush(context, SPSplash());
      case 'Run time permission':
        return navigationPush(context, PermissionHelper());
//    case ''
    }
  }
}
