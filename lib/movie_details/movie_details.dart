import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Model/details_response.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/movie_details/movie_details_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatefulWidget {
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
  MovieDetailsViewModel movieDetailsViewModel = MovieDetailsViewModel();
  Genres? geners;
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.movieDetailsViewModel.getId(widget.geners?.id);
    print("************************");
    print("${widget.geners?.id}");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget.movieDetailsViewModel,
        child: Consumer<MovieDetailsViewModel>(
            builder: (context, movieDetailsViewModel, child) {
          if (movieDetailsViewModel.errorMessage != null) {
            print("-------------------------");
            print(movieDetailsViewModel.errorMessage);
            print("-------------------------");

            return Text("Wrong",style: TextStyle(color: Colors.white),

            );
          } else if (movieDetailsViewModel.type == null) {
            return CircularProgressIndicator(
              color: MyTheme.yellowColor,
            );
          } else {
            var item = movieDetailsViewModel.type;
            return Text(
              '${item}',
              style: TextStyle(color: Colors.white),
            );
          }
        }));
  }
}
