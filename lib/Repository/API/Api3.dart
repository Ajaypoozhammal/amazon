import 'dart:convert';
import 'package:http/http.dart';

import '../ModelClass/AmazonModel3.dart';
import 'api_client.dart';




class AmazonApi3 {
  ApiClient apiClient = ApiClient();


  Future<AmazonModel3> getAmazon3(String id) async {
    String trendingpath = 'https://real-time-amazon-data.p.rapidapi.com/product-reviews?asin=$id&country=US&sort_by=TOP_REVIEWS&star_rating=ALL&verified_purchases_only';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return AmazonModel3.fromJson(jsonDecode(response.body));
  }
}