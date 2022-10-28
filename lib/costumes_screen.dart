import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/sim_search_controller.dart';

class RecommendCostumes extends StatefulWidget {
  const RecommendCostumes({super.key});

  @override
  State<RecommendCostumes> createState() => _RecommendCostumesState();
}

class _RecommendCostumesState extends State<RecommendCostumes> {
  TextEditingController textController = TextEditingController();
  String _text = 'selected costume will appear here..';

  final SimSearchController simSearchController =
      Get.put(SimSearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, 
        title: const Text('Halloween Costume Recommendations by Lakehmon'),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
            child: TextField(
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 1,
              controller: textController,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w400,
                ),
                hintText: "Write a scary costume description",
                labelText: "My costume idea",
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(10)),
                disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(10)),
              ),
              onEditingComplete: () {
                setState(() {
                  _text = textController.text;
                });
              },
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
            onPressed: () {
              setState(() {
                _text = textController.text;
              });
              simSearchController.getProxySimSearchResults(
                  "http://localhost:8000/simsearch?utterance=$_text");
              Future.delayed(const Duration(seconds: 1));
              simSearchController.simSearchResultAvailable = true;
            },
            child: const Text("Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
       
          const SizedBox(
            height: 20,
          ),
          Text(
            "Top recommendations for $_text",
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
// Add the results to a datatable
          (simSearchController.simSearchResultAvailable)
              ? DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Costume',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Match Score',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Obx(
                            () => Text(
                              simSearchController.recom1.value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataCell(
                          Obx(
                            () => Text(
                              simSearchController.ss1.value.toStringAsFixed(2),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Obx(
                            () => Text(
                              simSearchController.recom2.value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataCell(
                          Obx(
                            () => Text(
                              simSearchController.ss2.value.toStringAsFixed(2),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Obx(
                            () => Text(
                              simSearchController.recom3.value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataCell(
                          Obx(
                            () => Text(
                              simSearchController.ss3.value.toStringAsFixed(2),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              : const Text('No results yet'),
        ],
      ),
    );
  }

}
