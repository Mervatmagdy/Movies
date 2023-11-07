import 'package:flutter/foundation.dart';
import 'package:movies/Api/api_manage.dart';
import 'package:movies/Model/samiler_response.dart';

class SimilarMovieViewModel extends ChangeNotifier{
  String? errorMessage;
  List<Results>? movies;

  void getSimilarMovies(String? id) async{
    errorMessage= null;
    movies= null;
    notifyListeners();
    try{
      var response = await ApiManage.getSimilarMovies(id: id);
      if(response?.status_code == 34){
        errorMessage = response?.status_message;
      }
      else
      {
        movies = response?.results;
      }
    }catch(e){
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}