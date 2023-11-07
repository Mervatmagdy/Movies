import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Model/samiler_response.dart';

class MovieItemSimilar extends StatelessWidget{
  Results movie;
  MovieItemSimilar({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7)
      ),
      child: Stack(
          children: [
            Column(
              children: [
                Image.network(
                  scale:4.1,
                  "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                ),
              Row(
                children: [
                  Image.asset("assets/star.png"),
                  SizedBox(width: 10,),
                  Text('${movie.voteAverage}',style: Theme.of(context).textTheme.titleSmall,),
                ],
              ),
                Text("${movie.title}",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 10),),
                Text("${movie.releaseDate}",style: Theme.of(context).textTheme.titleSmall,),
              ],
            ),
            Image.asset('assets/addIcon.png',),]),
    );
  }

}