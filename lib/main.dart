import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/Browser/browser_tab.dart';
import 'package:movies/Home/home_screen.dart';
import 'package:movies/Model/added_movie_provider.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/Search/search_tab.dart';
import 'package:movies/WatchList/watch_tab.dart';
import 'package:provider/provider.dart';

void main()async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

   // FirebaseFirestore.instance.settings =
   //     Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
   // await FirebaseFirestore.instance.disableNetwork();

  runApp(ChangeNotifierProvider(
    create: (context) =>AddedMovieProvider(),
      child: MyApp()));
}
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName ,
      routes:{
        HomeScreen.routeName:(context) => HomeScreen(),
        SearchTab.routeName:(context) => SearchTab(),
        BrowserTab.routeName:(context) => BrowserTab(),
        WatchTab.routeName:(context) => WatchTab()
      } ,
      theme:MyTheme.lightTheme,
    );
  }
}