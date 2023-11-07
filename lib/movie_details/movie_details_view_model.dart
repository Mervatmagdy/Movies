import 'package:flutter/cupertino.dart';
import 'package:movies/Api/api_manage.dart';
import 'package:movies/Model/details_response.dart';

class MovieDetailsViewModel extends ChangeNotifier{
  String? type;
  String? errorMessage;

  void getId(num? movieId)async{

    var response = await ApiManage.getMovieDetailsById(id: movieId);
    try{
      if(response?.status_code == 34){
        errorMessage = response?.status_message;
      }
      else{
        type = response?.name;
      }
    }catch(e){
      errorMessage = "Loading Error";
    }
    notifyListeners();
  }
}
