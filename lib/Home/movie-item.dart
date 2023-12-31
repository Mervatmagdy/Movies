import 'package:flutter/material.dart';
import 'package:movies/Model/added_movie_provider.dart';
import 'package:movies/Model/firebase_utils.dart';
import 'package:movies/Model/popular_response.dart';
import 'package:movies/movie_details/movie_details_tap.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatefulWidget {
Results movie;
double? scale;

MovieItem({required this.movie,});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
bool isWatchList=false;
@override
  void didChangeDependencies() {
  super.didChangeDependencies();
var provider=Provider.of<AddedMovieProvider>(context);
    if(provider.watchListMovie.isEmpty){
      provider.readWatchListFromFireStore(widget.movie);
    }

    isWatchList=provider.checkExistMovie(widget.movie);

  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddedMovieProvider>(context);
    return InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(MovieDetailsTab.routeName,arguments:widget.movie );
        },
      child: Container(

        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7)
        ),
        child: Stack(
            children: [
              Image.network(
                scale: 4.1,

                "https://image.tmdb.org/t/p/w500${widget.movie.posterPath}" +
                   '',
              ),
              InkWell(
                  onTap: () {
                   provider.onClickedWatchList(widget.movie, isWatchList);
                  },
                  child:isWatchList==true ? Image.asset(
                    'assets/afterAdd.png',) : Image.asset('assets/addIcon.png',)),

            ]),
      ),
    );
  }

}
