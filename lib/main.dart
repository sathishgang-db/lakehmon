import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:lakehmon/monster_screen.dart';
import 'package:lottie/lottie.dart';

import 'loading_screen.dart';

void main() => runApp( GetMaterialApp(
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,

    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: Stack(children: [
          // Load a Lottie file from your assets
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Lottie.asset(
                'assets/anim/83435-happy-halloween-animation-background.json',
                fit: BoxFit.cover),
          ),          //Text for "HAUNTED LAKEHOUSE"
          Positioned(
            bottom: appHeight * 0.05,
            left: appWidth * 0.1,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 1),
              style: GoogleFonts.eater(
                letterSpacing: 3.0,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              child: const Text(
                "🎃 HAUNTED LAKEHOUSE ",
              ),
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
        onPressed: () => Get.to(() => const LoadingScreen()),
          child: const AvatarGlow(
            glowColor: Colors.orange,
            endRadius: 90.0,
            child: Icon(
              FontAwesomeIcons.ghost,
              color: Colors.white,
              semanticLabel: "enter",
            ),
          ),
        ),
      ),
    );
  }
}
