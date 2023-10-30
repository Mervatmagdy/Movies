import 'package:flutter/material.dart';
import 'package:movies/Home/new_release.dart';
import 'package:movies/Home/popular_slider.dart';
import 'package:movies/Home/recommended.dart';
class HomeTab extends StatefulWidget {
  static const routeName='home_tab';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PopularSlider(),
          NewRelease(),
          SizedBox(height:MediaQuery.sizeOf(context).height*0.03,),
          Recommended(),
          SizedBox(height:MediaQuery.sizeOf(context).height*0.03,),
        ],
      ),
    );
  }


}











//     AnimatedSmoothIndicator(
//  activeIndex:scroll,
//       count: imgList.length,
//       effect:ScrollingDotsEffect(),
//       curve: accelerateEasing,
//       onDotClicked: (index) {
//         setState(() {
//           index=scroll;
//         });
//       },
//     )
//       ],
//     );
//   }
//
// }
