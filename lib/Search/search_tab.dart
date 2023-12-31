import 'package:flutter/material.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/Search/search_delegate.dart';

class SearchTab extends StatelessWidget {
  static const routeName='search';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.1,
          ),
          // Container(color: Colors.red, width: 200,height: 200,),
          ElevatedButton(
            onPressed: (){
              showSearch(context: context, delegate:
              searchDelegate());
            },
              style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            backgroundColor: MyTheme.geryColor,
            elevation: 0,
            shape: StadiumBorder(side: BorderSide(width: 3,color: MyTheme.iconColor)),
    ),

            child: Row(
              children: [
                Icon(Icons.search_rounded,color: MyTheme.iconColor,),
                SizedBox(width: 10,),
                Text("Search", style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18),textAlign: TextAlign.left,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
