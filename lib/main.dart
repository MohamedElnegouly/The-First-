import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/layout/Home_Layout.dart';
import 'package:project1/modules/Done_Tasks/Done_Tasks_Screen.dart';
import 'package:project1/modules/New_Tasks/New_Tasks_Screen.dart';
import 'package:project1/modules/bmi/Bmi_Calculater.dart';
import 'package:project1/modules/counter/Counter_screen.dart';
import 'package:project1/modules/messenger/messenger_screen.dart';
import 'package:project1/shared/Bloc_Observer.dart';

import 'modules/home/home_screen.dart';
import 'modules/login/login_screen.dart';
import 'modules/login/sign up.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
