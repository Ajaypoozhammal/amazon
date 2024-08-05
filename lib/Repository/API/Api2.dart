import 'dart:convert';

import 'package:amazone/Repository/ModelClass/AmazonModel2.dart';
import 'package:http/http.dart';

import 'api_client.dart';




class AmazonApi2 {
  ApiClient apiClient = ApiClient();


  Future<AmazonModel2> getAmazon() async {
    String trendingpath = 'https://real-time-amazon-data.p.rapidapi.com/product-details?asin=B0BQ118F2T&country=US';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return AmazonModel2.fromJson(jsonDecode(response.body));
  }
}