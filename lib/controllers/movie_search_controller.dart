import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';

class MovieSearchController extends GetxController {
  var recom1 = ''.obs;
  var recom2 = ''.obs;
  var recom3 = ''.obs;
  var plot1 = ''.obs;
  var plot2 = ''.obs;
  var plot3 = ''.obs;
  var ss1 = 0.0.obs;
  var ss2 = 0.0.obs;
  var ss3 = 0.0.obs;
  late Map<String, dynamic> simSearchResponse;
  bool simSearchResultAvailable = false;
  void getProxySimSearchResults(String uri) async {
    d.Dio dio = d.Dio();
    d.Response response = await dio.get(
      uri,
    );
    simSearchResponse = response.data;
    recom1.value =
        simSearchResponse['predictions']['title'].entries.elementAt(0).value;
    recom2.value =
        simSearchResponse['predictions']['title'].entries.elementAt(1).value;
    recom3.value =
        simSearchResponse['predictions']['title'].entries.elementAt(2).value;

    plot1.value =
        simSearchResponse['predictions']['plot'].entries.elementAt(0).value;
    plot2.value =
        simSearchResponse['predictions']['plot'].entries.elementAt(1).value;
    plot3.value =
        simSearchResponse['predictions']['plot'].entries.elementAt(2).value;

    ss1.value = simSearchResponse['predictions']['sim_score']
        .entries
        .elementAt(0)
        .value;
    ss2.value = simSearchResponse['predictions']['sim_score']
        .entries
        .elementAt(1)
        .value;
    ss3.value = simSearchResponse['predictions']['sim_score']
        .entries
        .elementAt(2)
        .value;
    simSearchResultAvailable = simSearchResponse.isNotEmpty;
    // print(ss1); this is a double
    update();
  }
}
