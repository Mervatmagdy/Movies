import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Model/popular_response.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/movie_details/movie_details_tap.dart';

class searchItem extends StatelessWidget{

  Results item ;

  searchItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return
      // ListTile(
      //   title: Text("This is my ListTile",style: Theme.of(context).textTheme.titleLarge,),
      //   trailing: Wrap(
      //     spacing: 12, // space between two icons
      //     children: <Widget>[
      //       Icon(Icons.call), // icon-1
      //       Icon(Icons.message), // icon-2
      //     ],
      //   ),
      // );
      // InkWell(
      //   onTap: (){
      //     Navigator.of(context).pushNamed(MovieDetails.routeName);
      //   },
      //   child: ListTile(
      //     leading:
      //         // Icon(Icons.ice_skating),
      //     CachedNetworkImage(
      //       width: MediaQuery.of(context).size.width*0.3,
      //       height: double.infinity,
      //       fit: BoxFit.cover,
      //       imageUrl: "https://image.tmdb.org/t/p/w500" +
      //           item.backdropPath!,
      //       placeholder: (context, url) =>
      //           Center(
      //             child: CircularProgressIndicator(
      //               color: MyTheme.yellowColor,
      //             ),
      //           ),
      //       errorWidget: (context, url, error) =>
      //           Icon(
      //             Icons.error,
      //             color: MyTheme.yellowColor,
      //           ),
      //     ),
      //     title: Text(item.title ?? "",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.whiteColor,fontSize: 20),),
      //     subtitle: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         SizedBox(height: 5,),
      //         Text(
      //           item.releaseDate ?? "",
      //           style: Theme
      //               .of(context)
      //               .textTheme
      //               .titleMedium!
      //               .copyWith(fontSize: 15, color: MyTheme.iconColor),
      //         ),
      //         SizedBox(height: 5,),
      //
      //         Text(
      //           item.title ?? "",
      //           style: Theme
      //               .of(context)
      //               .textTheme
      //               .titleMedium!
      //               .copyWith(fontSize:15, color: MyTheme.iconColor),
      //         ),
      //       ],
      //     ),
      //
      //   ),
      // );

      InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(MovieDetailsTab.routeName,arguments: item);
        },
        child: Container(
          padding: EdgeInsets.all(3),
          // width: MediaQuery.of(context).size.width * 0.90,
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.45,
                      maxHeight: MediaQuery.of(context).size.width * 0.50,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width*0.45,
                              height: MediaQuery.of(context).size.width*0.3,
                              fit: BoxFit.cover,
                              imageUrl:  "https://image.tmdb.org/t/p/w500" +
                                 "${item.backdropPath ?? ""}",
                              placeholder: (context, url) =>
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: MyTheme.yellowColor,
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                                  Icon(
                                    Icons.error,
                                    color: MyTheme.yellowColor,
                                  ),
                            ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text(
                          item.title ??"",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.whiteColor,fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child: Text(
                          item.releaseDate??"",
                          style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 15, color: MyTheme.iconColor),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child: Text(
                          item.originalTitle??"",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 15, color: MyTheme.iconColor),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      );

  }
  }