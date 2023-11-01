import 'package:flutter/material.dart';
import 'package:movies/Model/firebase_utils.dart';
import 'package:movies/Model/popular_response.dart';

class AddedMovieProvider extends ChangeNotifier {
  // bool? checked;

  // void watchList(Results movie,value) {
  //
  //   // if (movie.added==null) {
  //   //   movie.added =true;
  //   //   FirebaseUtils.updateWatchListMovie(movie,true);
  //   //   FirebaseUtils.addWatchListMovie(movie);
  //   //
  //   // } else{
  //   //   movie.added=null;
  //   //   FirebaseUtils.updateWatchListMovie(movie,null);
  //   //   FirebaseUtils.deleteWatchListMovie(movie);
  //   // }
  //   notifyListeners();
  // }

 List<Results> watchListMovie=[];
  Future<void> readWatchListFromFireStore(Results movie) async {
    var querySnapShot = await FirebaseUtils.getWatchListMovies().get();
    watchListMovie = querySnapShot.docs.map((doc) {
      return doc.data();
    }).toList();
    watchListMovie.sort((a, b) => a.title!.compareTo(b.title!));
    notifyListeners();
  }

  checkExistMovie(Results movie) {
    for (int i = 0; i <watchListMovie.length; i++) {
      if (watchListMovie[i].id == movie.id) {
       movie.added=true;
       // watchListMovie[i].added=true;
      }else{
        movie.added=false;
      }

    }

  }

}
