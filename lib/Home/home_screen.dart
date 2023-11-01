import 'package:flutter/material.dart';
import 'package:movies/Browser/browser_tab.dart';
import 'package:movies/Model/added_movie_provider.dart';
import 'package:movies/Model/firebase_utils.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/Search/search_tab.dart';
import 'package:movies/WatchList/watch_tab.dart';
import 'package:provider/provider.dart';

import 'home_tab.dart';


class HomeScreen extends StatefulWidget {
static const routeName='home_screen';
List<Widget>tabs=[HomeTab(),SearchTab(),BrowserTab(),WatchTab()];
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedTap=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:MyTheme.primaryColor,
      bottomNavigationBar:Theme(
        data:Theme.of(context).copyWith(
            canvasColor:MyTheme.navigateColor
        ),
        child: BottomNavigationBar(

          currentIndex:selectedTap,
            onTap:(select){
            selectedTap=select;
            setState(() {

            });
            },
            items:[

          BottomNavigationBarItem(icon:Icon(Icons.home),label:'HOME',),
              BottomNavigationBarItem(icon:Icon(Icons.search),label:'SEARCH', ),
              BottomNavigationBarItem(icon:Icon(Icons.web_asset),label: 'BROWSER',),
              BottomNavigationBarItem(icon:Icon(Icons.web_stories),label:'WATCHLIST'),
        ]),
      ),
      body:widget.tabs[selectedTap],
    );
  }
}
