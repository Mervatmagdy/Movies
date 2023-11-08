import 'package:flutter/material.dart';
import '../../model/MovieDetailsResponse.dart';


class MovieItem extends StatelessWidget {
  List<Results> moviesList ;
  int index;
  MovieItem({required this.moviesList , required this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network('https://image.tmdb.org/t/p/w500${moviesList[index].backdropPath?? '' }' ,
              width:MediaQuery.of(context).size.width*0.5,
             height:MediaQuery.of(context).size.height*0.1,) ,
            Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Container(child: Text(moviesList[index].title ??'', style: Theme.of(context).textTheme.titleMedium,),
              width: MediaQuery.of(context).size.width*0.4,),
              Text('Rating :${moviesList[index].voteAverage}',style: Theme.of(context).textTheme.titleSmall,),
              Text('Released : ${moviesList[index].releaseDate}', style: Theme.of(context).textTheme.titleSmall,),
            ],),

          ],

        ),
      ),
    );
  }
}