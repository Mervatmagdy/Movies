import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Api/api_manage.dart';
import 'package:movies/Home/movie-item.dart';
import 'package:movies/Home/recommend_item.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/movie_details/Similar/similar_movie_view_model.dart';
import 'package:provider/provider.dart';
import 'package:movies/Model/popular_response.dart';

class SimilarMovies extends StatefulWidget {

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
  SimilarMovieViewModel similarMovieViewModel = SimilarMovieViewModel();
  Results movie;
  SimilarMovies({required this.movie});
}

class _SimilarMoviesState extends State<SimilarMovies> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.similarMovieViewModel.getSimilarMovies(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyTheme.geryColor,
      ),
      height:MediaQuery.sizeOf(context).height*0.70,
      child: ChangeNotifierProvider(
          create: (context) => widget.similarMovieViewModel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text("More Like this",style: Theme.of(context).textTheme.titleLarge),
          ),
          SizedBox(height: 20,),

          Consumer<SimilarMovieViewModel>(builder: (context,similarMovieViewModel,child){
            if(similarMovieViewModel.errorMessage != null){
              return Center(
                child: Column(
                  children: [
                    Text("SomeThing went Wrong",style: TextStyle(color: Colors.white),),
                    ElevatedButton(
                        onPressed: () {
                         similarMovieViewModel.getSimilarMovies(widget.movie.id);
                          setState(() {
                            print(widget.movie.id);
                            print("------------------------------------");
                            print(similarMovieViewModel.errorMessage);
                            print("------------------------------------");

                          });
                        },
                        child: Text("Try Again"))
                  ],
                ),
              );
            }
            else if(similarMovieViewModel.movies == null){
              return CircularProgressIndicator();
            }
            else{
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                     final item =  similarMovieViewModel.movies![index];
                      return Padding(
                        padding:EdgeInsets.only(bottom: 15, left: 5, right: 10),
                        child: RecommendItem(movie: item),
                      );
                    },
                    itemCount: similarMovieViewModel.movies?.length,
                ),
              );
            }
          },
          ),
        ],
      ),

      ),
    );

  }
}
