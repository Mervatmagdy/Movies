import 'package:flutter/material.dart';
import 'package:movies/Browser/browser_tab.dart';
import 'package:movies/Home/home_screen.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/Search/search_delegate_view_model.dart';
import 'package:movies/Search/search_tab.dart';
import 'package:movies/WatchList/watch_tab.dart';
import 'package:movies/movie_details/movie_details_tap.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(

        create: (context) => SearchDelegateViewModel(),

      child:
      MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName ,
      routes:{
        MovieDetailsTab.routeName:(context) => MovieDetailsTab(),
        HomeScreen.routeName:(context) => HomeScreen(),
        SearchTab.routeName:(context) => SearchTab(),
        BrowserTab.routeName:(context) => BrowserTab(),
        WatchTab.routeName:(context) => WatchTab()
      } ,
      theme:MyTheme.lightTheme,
      ));
  }

}