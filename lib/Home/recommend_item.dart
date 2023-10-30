import 'package:flutter/material.dart';
import 'package:movies/Home/movie-item.dart';
import 'package:movies/Model/popular_response.dart';
import 'package:movies/MyTheme.dart';

class RecommendItem extends StatelessWidget {
Results movie;
RecommendItem({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color:MyTheme.geryContainer,),

      width:MediaQuery.sizeOf(context).width*0.4,
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieItem(pathImage:movie.posterPath!),
           SizedBox(height: 10,),
           Row(
             children: [
               Icon(Icons.star,color:MyTheme.yellowColor,),
               SizedBox(width: 5,),
               Text(movie.voteAverage.toString(),style:Theme.of(context).textTheme.titleSmall,)
             ],
           ),
            SizedBox(height:10,),
            Text('${movie.title}',style:Theme.of(context).textTheme.titleSmall!.copyWith(color: MyTheme.whiteColor),),
            SizedBox(height:10,),
            Text(movie.releaseDate!,style:Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12,fontWeight:FontWeight.normal),)
          ],
        ),
      ),
    );
  }
}
