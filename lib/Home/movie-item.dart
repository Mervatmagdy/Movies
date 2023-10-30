import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
String pathImage;
MovieItem({required this.pathImage});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7)
      ),
      child: Stack(
        children: [
        Image.network(
        scale:4.1,
        "https://image.tmdb.org/t/p/w500" +
            pathImage,
      ),
      Image.asset('assets/addIcon.png',),]),
    );
  }
}
