import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:movies/Api/api_constant.dart';
import 'package:movies/Home/new_release.dart';
import 'package:movies/Model/discover_response.dart';
import 'package:movies/Model/popular_response.dart';
class ApiManage{
static Future<PopularResponse> getPopularApi()async{
  ///https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'
  Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.popularUrl,{
    'api_key':'001980e37e125ade2ff7f7ff71d9e93a'
  });
  try{
    var response=await http.get(url);
    var bodyString=response.body;
    var json=jsonDecode(bodyString);
    var object=PopularResponse.fromJson(json);
    return object;
  }catch(e){
    throw e;
  }
}
//'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte={min_date}&release_date.lte={max_date}' \
static Future<DiscoverResponse> getNewRelease()async{
  Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.discoverUrl,{
    'api_key':'001980e37e125ade2ff7f7ff71d9e93a',
    'release_date.gte':'${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}'
  });
try{
  var response= await http.get(url);
  var bodyString=response.body;
  var json=jsonDecode(bodyString);
  var object=DiscoverResponse.fromJson(json);
  return object;
}catch(e){
  throw e;
}
}
static Future<DiscoverResponse> getRecommend()async{
  Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.discoverUrl,{
    'api_key':'001980e37e125ade2ff7f7ff71d9e93a',
    'sort_by':'vote_average.desc',
    'vote_count.gte':'200'
  });
  try{
    var response= await http.get(url);
    var bodyString=response.body;
    var json=jsonDecode(bodyString);
    var object=DiscoverResponse.fromJson(json);
    return object;
  }catch(e){
    throw e;
  }
}
}