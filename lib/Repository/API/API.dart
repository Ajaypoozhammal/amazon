import 'dart:convert';

import 'package:http/http.dart';


import '../ModelClass/AmazonModel.dart';
import 'api_client.dart';




class AmazonApi {
  ApiClient apiClient = ApiClient();


  Future<AmazonModel> getAmazon() async {
    String trendingpath = 'https://real-time-amazon-data.p.rapidapi.com/search?query=Phone&page=1&country=US&sort_by=RELEVANCE&product_condition=ALL';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return AmazonModel.fromJson(jsonDecode(response.body));
  }
}