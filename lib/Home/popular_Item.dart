import 'package:flutter/material.dart';
import 'package:movies/Home/movie-item.dart';
import 'package:movies/Model/popular_response.dart';
import 'package:movies/MyTheme.dart';

class PopularItem extends StatelessWidget {

  Results index ;
  PopularItem({required this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              child: Image.network(
                width: double.infinity,
                "https://image.tmdb.org/t/p/w500" +
                    index.backdropPath!,
              )),
          Center(
              heightFactor: 5,
              child: Image.asset('assets/play-button-2.png', scale: 1.2)),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.15,
                // bottom: MediaQuery.sizeOf(context).height * 0.15,
                left: MediaQuery.sizeOf(context).width * 0.04),
            // padding: EdgeInsets.symmetric(vertical:MediaQuery.sizeOf(context).height*0.15,horizontal:MediaQuery.sizeOf(context).width*0.04),
            child: Stack(
              children: [
               MovieItem(pathImage:index.posterPath!),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.21,
                      // bottom: MediaQuery.sizeOf(context).height * 0.21,
                      left: MediaQuery.sizeOf(context).width * 0.42),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                       index.title!,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 5,),
                      Text(
                        index.releaseDate!,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize:11,color:MyTheme.iconColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
