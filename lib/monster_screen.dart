import 'package:flutter/material.dart';
import 'products.dart';
import 'package:rive/rive.dart';
import 'widgets/custom_widgets.dart';

class MonsterScreen extends StatefulWidget {
  const MonsterScreen({super.key});

  @override
  State<MonsterScreen> createState() => _MonsterScreenState();
}

class _MonsterScreenState extends State<MonsterScreen> {
  late RiveAnimationController _controller;
  bool _isPlaying = false;
  var acceptedData = 0;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation('bobControl');
    // _controller = OneShotAnimation(
    //   'bobControl',
    //   autoplay: true,
    //   onStop: () => setState(() => _isPlaying = false),
    //   onStart: () => setState(() => _isPlaying = true),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;
    final dWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 39, 39),
      appBar: AppBar(
        title: Text(
          "Score: $acceptedData",
          style: const TextStyle(
            letterSpacing: 2.0,
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 197, 39, 39),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: dHeight * 0.05,
          ),
          buildNarrative(acceptedData),
          SizedBox(
            height: dHeight * .6,
            child: Stack(
              children: [
                Center(
                  heightFactor: 1.3,
                  child: RiveAnimation.asset(
                    'assets/anim/monster.riv',
                    animations: const ['idle'],
                    fit: BoxFit.contain,
                    controllers: [_controller],
                  ),
                ),
                Center(
                  child: DragTarget(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Container(
                        height: dHeight * 0.2,
                        color: Colors.transparent,
                        width: dWidth * 0.2,
                      );
                    },
                    onAccept: (int data) {
                      setState(() {
                        acceptedData += data;
                        buildNarrative(acceptedData);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Draggable(
                    data: 10,
                    feedback: Material(
                      color: Colors.transparent,
                      child: buildItem(products[0].name, products[0].image,
                          dWidth * .15, dHeight * .1),
                    ),
                    child: buildItem(products[0].name, products[0].image,
                        dWidth * .15, dHeight * .1),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Draggable(
                    data: 20,
                    feedback: Material(
                      color: Colors.transparent,
                      child: buildItem(products[1].name, products[1].image,
                          dWidth * .15, dHeight * .1),
                    ),
                    child: buildItem(products[1].name, products[1].image,
                        dWidth * .15, dHeight * .1),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Draggable(
                    data: 30,
                    feedback: Material(
                      color: Colors.transparent,
                      child: buildItem(products[2].name, products[2].image,
                          dWidth * .15, dHeight * .1),
                    ),
                    child: buildItem(products[2].name, products[2].image,
                        dWidth * .15, dHeight * .1),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Draggable(
                    data: -50,
                    feedback: Material(
                      color: Colors.transparent,
                      child: buildItem(products[3].name, products[3].image,
                          dWidth * .15, dHeight * .1),
                    ),
                    child: buildItem(products[3].name, products[3].image,
                        dWidth * .15, dHeight * .1),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Draggable(
                    data: 50,
                    feedback: Material(
                      color: Colors.transparent,
                      child: buildItem(products[4].name, products[4].image,
                          dWidth * .15, dHeight * .1),
                    ),
                    child: buildItem(products[4].name, products[4].image,
                        dWidth * .15, dHeight * .1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//   Widget _buildItem(String name, String asset) {
//     return Container(
//       width: 400,
//       height: 400,
//       child: CarouselSlider(
//   options: CarouselOptions(height: 400.0,
//   viewportFraction: 0.6),
//   items: products.map((i) {
//       return Builder(
//         builder: (BuildContext context) {
//           return Padding(
//         padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
//         child: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.2,
//               height: MediaQuery.of(context).size.width * 0.1,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(i.image),
//                   fit: BoxFit.cover,
//                 ),
//                 shape: BoxShape.rectangle,
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             Text(
//               i.name,
//               style: const TextStyle(
//                 fontSize: 20,
//                 letterSpacing: 3.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       );
//         },
//       );
//   }).toList(),
// ),
//     );
//   }

}
