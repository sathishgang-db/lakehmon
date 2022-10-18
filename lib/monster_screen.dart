import 'package:flutter/material.dart';
import 'products.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'widgets/custom_widgets.dart';

class MonsterScreen extends StatefulWidget {
  const MonsterScreen({super.key});

  @override
  State<MonsterScreen> createState() => _MonsterScreenState();
}

class _MonsterScreenState extends State<MonsterScreen> {
  // late RiveAnimationController _controller;
  // bool _isPlaying = false;
  var acceptedData = 10;
  Artboard? _riveArtboard;
  Artboard? _eriveArtboard;
  SMIInput<bool>? _happy;
  SMIInput<double>? _color;
  SMIInput<double>? _energy;
  SMITrigger? _anger;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/anim/monsterAlt.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'creature');
        if (controller != null) {
          artboard.addController(controller);
          _happy = controller.findInput('isHappy (Boolean)');
          _happy?.value = false;
          _color = controller.findInput('color (Number)');
          _color?.value = 1.0;
          _anger =
              controller.findInput<bool>('isAngry (Trigger)') as SMITrigger?;
        }
        setState(() => _riveArtboard = artboard);
      },
    );
    rootBundle.load('assets/anim/energy_bar.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final eFile = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final eArtboard = eFile.mainArtboard;
        var eController =
            StateMachineController.fromArtboard(eArtboard, 'State Machine ');
        if (eController != null) {
          eArtboard.addController(eController);

          _energy = eController.findInput('Energy');
          _energy?.value = 10.0;
        }
        setState(() => _eriveArtboard = eArtboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;
    final dWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: 
      Scaffold(
        // backgroundColor: const Color.fromARGB(255, 197, 39, 39),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        // appBar: AppBar(
        //   title: Text(
        //     "Score: $acceptedData",
        //     style: const TextStyle(
        //       letterSpacing: 2.0,
        //       color: Colors.white,
        //       fontSize: 30,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Expanded(
              child: SizedBox(
                width: dWidth,
                child: _eriveArtboard == null
                    ? const Text('')
                    : Rive(
                        artboard: _eriveArtboard!,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      ),
              ),
            ),
            buildNarrative(acceptedData),
            SizedBox(
              height: dHeight * .5,
              child: Stack(
                children: [
                  Center(
                    child: _riveArtboard == null
                        ? const SizedBox()
                        : Rive(
                            artboard: _riveArtboard!,
                            fit: BoxFit.contain,
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
                          if (data >= 0) {
                            _happy?.value = true;
                            _energy?.value = acceptedData.toDouble();
                            // sleep(const Duration(seconds:1));
                            // _happy?.value = false;
                            _color?.value = 1.0;
                          } else if (data < 0 && _happy?.value == true) {
                            _happy?.value = false;
                            _energy?.value = acceptedData.toDouble();
                            _color?.value = 2.0;
                          } else {
                            _color?.value = 3.0;
                            _energy?.value = acceptedData.toDouble();
                            _anger?.fire();
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: acceptedData<0?[]:[
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
                      data: -45,
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
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.orange,
          onPressed: () {
            setState(() {
              acceptedData = 10;
              _happy?.value = false;
              _color?.value = 1.0;
              _energy?.value = 10.0;
            });
          },
          child: const Icon(
            Icons.refresh,
          ),
        ),
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
