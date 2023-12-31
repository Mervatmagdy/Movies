import 'package:flutter/material.dart';
import 'package:movies/Home/movie-item.dart';
import 'package:movies/Model/added_movie_provider.dart';
import 'package:movies/Model/popular_response.dart';
import 'package:movies/MyTheme.dart';
import 'package:provider/provider.dart';

class RecommendItem extends StatefulWidget {
  Results movie;
  RecommendItem({required this.movie});

  @override
  State<RecommendItem> createState() => _RecommendItemState();
}

class _RecommendItemState extends State<RecommendItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: MyTheme.geryContainer,
      ),
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieItem(movie: widget.movie),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: MyTheme.yellowColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.movie.voteAverage.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${widget.movie.title}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.whiteColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.movie.releaseDate!,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 12, fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
