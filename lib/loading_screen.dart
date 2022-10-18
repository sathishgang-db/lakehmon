import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lakehmon/monster_screen.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 7),
      () => Get.to(
        () => const MonsterScreen(),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Lottie.asset("assets/anim/halloween-pumpkin-candy.json"),),
          ),
          DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        letterSpacing: 2.0,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      child: AnimatedTextKit(
        pause: const Duration(milliseconds: 500),
        isRepeatingAnimation: false,
        animatedTexts: [
          TypewriterAnimatedText('Entering Lakehouse ...'),
          TypewriterAnimatedText('Hold on to your candy!'),
          TypewriterAnimatedText('Lakehmon is on the loose...'),
        ],
      ),
    ),
        ],
      ),
    );
  }
}
