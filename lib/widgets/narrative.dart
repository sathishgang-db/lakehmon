import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget buildNarrative(int acceptedData) {
  if (acceptedData == 0) {
    return DefaultTextStyle(
      style: const TextStyle(
        letterSpacing: 2.0,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      child: AnimatedTextKit(
        pause: const Duration(milliseconds: 2000),
        isRepeatingAnimation: false,
        animatedTexts: [
          TypewriterAnimatedText('Hi, I\'m Lakehmon!'),
          TypewriterAnimatedText('I\'m hungry!'),
          TypewriterAnimatedText('I escaped the warehouse...'),
          TypewriterAnimatedText('...to find food in the lakehouse!'),
          TypewriterAnimatedText('Feed me to keep me happy!!'),
          TypewriterAnimatedText('Select one item to feed me!'),
        ],
      ),
    );
  } else {
    return const Text(
      'Excellent!🎃 Now, Feed me again! 💀',
      style: TextStyle(
        letterSpacing: 2.0,
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
    // return DefaultTextStyle(
    //   style: const TextStyle(
    //     letterSpacing: 2.0,
    //     fontSize: 30,
    //     fontWeight: FontWeight.bold,
    //   ),
    //   child: AnimatedTextKit(
    //     pause: const Duration(milliseconds: 2000),
    //     isRepeatingAnimation: false,
    //     animatedTexts: [
    //       TypewriterAnimatedText("Score: $acceptedData!"),
    //     ],
    //   ),
    // );
  }
}


