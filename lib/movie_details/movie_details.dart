import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Model/details_responses.dart';
import 'package:movies/Model/popular_response.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/movie_details/movie_details_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatefulWidget {
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
  List<Genres>?genres;
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieDetailsViewModel movieDetailsViewModel = MovieDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    movieDetailsViewModel.getId(widget.genres?[0].id);

  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context) => movieDetailsViewModel,
        child: Consumer<MovieDetailsViewModel>(
            builder: (context, movieDetailsViewModel, child) {
          if (movieDetailsViewModel.errorMessage != null) {
            print("-------------------------");
            print(movieDetailsViewModel.errorMessage);
            print("-------------------------");

            return Text("Wrong",style: TextStyle(color: Colors.white),

            );
          } else if (movieDetailsViewModel.list == null) {
            return CircularProgressIndicator(
              color: MyTheme.yellowColor,
            );
          } else {
            var item = movieDetailsViewModel.list?[1].id;
            return Text(
              '${item}',
              style: TextStyle(color: Colors.white),
            );
          }
        }));
  }
}
