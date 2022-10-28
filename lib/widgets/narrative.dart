import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget buildNarrative(int acceptedData) {
  if (acceptedData == 10) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
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
  } else if (acceptedData < 0) {
    return const Text("Too bad! Game Over! 💀",
        style: TextStyle(
          letterSpacing: 2.0,
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ));
  } else if (acceptedData > 0 && acceptedData <= 70) {
    return const Text(
      "Ok! Keep feeding me to unlock AI powers! 🎉",
      style: TextStyle(
        letterSpacing: 2.0,
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  } else if (acceptedData > 70 && acceptedData <= 100) {
    return const Text(
      "You're almost there! Just a little more.. 🍬",
      style: TextStyle(
        letterSpacing: 2.0,
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  } else {
    return const Text(
      "You are the best! 💖 Select a task I can do for you! ✅",
      style: TextStyle(
        letterSpacing: 2.0,
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
