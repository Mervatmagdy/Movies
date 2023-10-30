import 'package:flutter/material.dart';
import 'package:movies/Api/api_manage.dart';
import 'package:movies/Model/popular_response.dart';

class PopularSliderViewModel extends ChangeNotifier{
  int scroll=0;
   List<Results>? popularList;
  String? errorMessage;
  Future<void> getPopularMovie()async{
    popularList=null;
    errorMessage=null;
    notifyListeners();
    try{
     var response=await ApiManage.getPopularApi();
     if(response.status_code==7){
       errorMessage=response.status_message;
     }else{
       popularList=response.results!;
     }
    }catch(e){
      errorMessage='no connection';
    }
    notifyListeners();
  }
}