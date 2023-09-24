

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  ShimmerWidget({
    required this.width,
    required this.height,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
     child: Card(
       elevation: 1.0,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(radius),
       ),
       child:  SizedBox(height: height,width: width,),
     )

    );
  }
}