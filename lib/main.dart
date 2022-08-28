import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstproject/pages/home_page.dart';
import 'package:myfirstproject/pages/login_page.dart';
import 'package:myfirstproject/utlis/routes.dart';
import 'package:myfirstproject/widgets/themes.dart';

void main(){
  runApp (MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bringvegetables(); // since we made all of them optional then it will take default values
    // int days  = 30;
    // 'num' takes both int and double
    // bool ismale = true;
    // const pi = 3.14;
    // var chr = "days";
    // var - apne aapcsmjh jata h ki kya h
    return MaterialApp(
      // home: Homepage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/" :(context) => LoginPage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute:(context) => LoginPage()
      },
    );
  }
  // bringvegetables({bool thaila = false ,int rupees = 100}){
  // }
}
