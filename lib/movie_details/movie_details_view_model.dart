import 'package:flutter/cupertino.dart';
import 'package:movies/Api/api_manage.dart';
import 'package:movies/Model/details_responses.dart';

class MovieDetailsViewModel extends ChangeNotifier{
  List<Genres>? list;
  String? errorMessage;


  void getId(num? movieId)async{

    try{
      var response = await ApiManage.getMovieDetailsById(id: movieId);
      if(response?.status_code == 34){
        errorMessage = response?.status_message;
        print("==============================");
        print(errorMessage);
        print("==============================");
        print("==============================");

      }
      else{
        list = response?.genres;
        print("==============================");
        print(list);
        print("==============================");
        print("==============================");


      }
    }catch(e){
      errorMessage = "Loading Error";
    }
    notifyListeners();
  }
}
