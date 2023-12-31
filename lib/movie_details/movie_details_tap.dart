import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Api/api_manage.dart';
import 'package:movies/Home/movie-item.dart';
import 'package:movies/Model/details_responses.dart';
import 'package:movies/Model/popular_response.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/movie_details/movie_details.dart';
import 'package:movies/movie_details/Similar/similar_movies.dart';

class MovieDetailsTab extends StatefulWidget {
  static String routeName = "MovieDetails";

  @override
  State<MovieDetailsTab> createState() => _MovieDetailsTabState();
}

class _MovieDetailsTabState extends State<MovieDetailsTab> {
  bool isSave = false;
  Results? result;
  // Genres? genres;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      result = ModalRoute.of(context)!.settings.arguments as Results;
    }
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      appBar: AppBar(
        title: Text(result?.title ?? ""),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.cover,
                      imageUrl: "https://image.tmdb.org/t/p/w500" +
                          "${result?.backdropPath}",
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.yellowColor,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: MyTheme.yellowColor,
                      ),
                    ),
                  ),
                  Center(
                      heightFactor: 5,
                      child:
                          Image.asset('assets/play-button-2.png', scale: 1.2)),
                ],
              ),
              Text(
                result?.title ?? "",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text(result?.releaseDate ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 11, color: MyTheme.iconColor)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                            child:ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: MovieItem(
                                  movie: result!,
                                ),
                                ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.deepOrange,
                        height: MediaQuery.of(context).size.height*0.1,
                          width: MediaQuery.of(context).size.width*0.57,
                          child: MovieDetails(
                        results: result!,
                      )),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.48,
                        height: MediaQuery.of(context).size.width * 0.4,
                        child: SingleChildScrollView(
                          child: Text(
                            "${result?.overview}",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/star.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${result?.voteAverage}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SimilarMovies(movie: result!),
            ],
          ),
        ),
      ),
    );
  }
}
