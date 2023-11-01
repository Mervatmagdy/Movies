import 'package:flutter/material.dart';
import 'package:movies/Model/added_movie_provider.dart';
import 'package:movies/Model/firebase_utils.dart';
import 'package:movies/Model/popular_response.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatefulWidget {
Results movie;
MovieItem({required this.movie});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {

@override
  void didChangeDependencies() {
  super.didChangeDependencies();
var provider=Provider.of<AddedMovieProvider>(context);
    if(provider.watchListMovie.isEmpty){
      provider.readWatchListFromFireStore(widget.movie);
    }

    provider.checkExistMovie(widget.movie);

  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddedMovieProvider>(context);
    //     if(provider.watchListMovie.isEmpty){
    //   provider.readWatchListFromFireStore(widget.movie);
    // }
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7)
      ),
      child: Stack(
          children: [
            Image.network(
              scale: 4.1,
              "https://image.tmdb.org/t/p/w500" +
                  widget.movie.posterPath!,
            ),
            InkWell(

                onTap: () {
                  // provider.watchList(widget.movie);
                  // provider.readWatchListFromFireStore();

                  setState(() {
                    if (widget.movie.added == null) {
                      widget.movie.added=true;
                      FirebaseUtils.updateWatchListMovie(widget.movie, true);
                      FirebaseUtils.addWatchListMovie(widget.movie);
                      provider.readWatchListFromFireStore(widget.movie);


                    } else {
                      widget.movie.added=false;
                      FirebaseUtils.deleteWatchListMovie(widget.movie);
                      provider.readWatchListFromFireStore(widget.movie);


                    }
                  });
                },
                child:widget.movie.added== true ? Image.asset(
                  'assets/afterAdd.png',) : Image.asset('assets/addIcon.png',)),
          ]),
    );
  }

}
