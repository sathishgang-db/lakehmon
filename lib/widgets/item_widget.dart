  import 'package:flutter/material.dart';

Widget buildItem(String name, String asset, double width, double height) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(asset),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.rectangle,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w100,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }