import 'package:flutter/cupertino.dart';
import 'package:movies/Api/api_manage.dart';
import 'package:movies/Model/details_responses.dart';

class MovieDetailsViewModel extends ChangeNotifier{
  List<Genres>? genres;
  String? errorMessage;


  void getId(num ?movieId)async{
    genres=null;
    errorMessage = null;
    notifyListeners();

    try{
      var response = await ApiManage.getMovieDetailsById(id: movieId);
      if(response?.status_code == 7) {
        errorMessage = response?.status_message;
        print(errorMessage);
      }
      else{
        genres = response?.genres;
        print("-------------------------");
        print(genres);
      }
    }catch(e){
      errorMessage = "Loading Error";
    }
    notifyListeners();
  }
}
