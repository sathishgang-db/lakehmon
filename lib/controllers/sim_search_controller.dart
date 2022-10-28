import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';

class SimSearchController extends GetxController {
   var recom1 = ''.obs;
   var recom2 = ''.obs;
   var recom3 = ''.obs;
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
    recom1.value = simSearchResponse['predictions']['product']['0'];
    recom2.value = simSearchResponse['predictions']['product']['1'];
    recom3.value = simSearchResponse['predictions']['product']['2'];
    ss1.value = simSearchResponse['predictions']['sim_score']['0'][0];
    ss2.value = simSearchResponse['predictions']['sim_score']['1'][0];
    ss3.value = simSearchResponse['predictions']['sim_score']['2'][0];
    simSearchResultAvailable = simSearchResponse.isNotEmpty;
    // print(ss1); this is a double
    update();
  }
}
