import 'package:flutter/material.dart';
import 'package:movies/Api/api_manage.dart';
import 'package:movies/Model/popular_response.dart';

class RecommendedViewModel extends ChangeNotifier{
  List<Results>? recommendedList;
  String? errorMessage;
  Future<void> getRecommendedMovie()async{
    recommendedList=null;
    errorMessage=null;
    notifyListeners();
    try{
      var response=await ApiManage.getRecommend();
      if(response.status_code==7){
        errorMessage=response.status_message;
      }else{
        recommendedList=response.results;
      }
    }catch(e){
      errorMessage='no connection';
    }
    notifyListeners();
  }
}