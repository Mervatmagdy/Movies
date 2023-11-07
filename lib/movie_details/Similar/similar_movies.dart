import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Api/api_manage.dart';
import 'package:movies/Model/popular_response.dart';
import 'package:movies/movie_details/Similar/movie_item_similar.dart';
import 'package:movies/movie_details/Similar/similar_movie_view_model.dart';
import 'package:provider/provider.dart';

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
    widget.similarMovieViewModel.getSimilarMovies(widget.movie.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.38,
      child: ChangeNotifierProvider(
          create: (context) => widget.similarMovieViewModel,
      child: Consumer<SimilarMovieViewModel>(builder: (context,similarMovieViewModel,child){
        if(similarMovieViewModel.errorMessage != null){
          return Center(
            child: Column(
              children: [
                Text("SomeThing went Wrong",style: TextStyle(color: Colors.white),),
                ElevatedButton(
                    onPressed: () {
                      ApiManage.getSimilarMovies(id:widget.movie.id.toString());
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
                    child: MovieItemSimilar(movie: item),
                  );
                },
                itemCount: similarMovieViewModel.movies?.length,
            ),
          );
        }
      },
      ),

      ),
    );

  }
}
