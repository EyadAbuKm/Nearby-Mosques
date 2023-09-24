import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:masjidi/shared/widgets/shiming_widget.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double radius;

  const ImageWidget({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return Image.asset("assets/empty.jpg");
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      errorWidget: (context, _, error) {
        return Image.asset(
          "assets/empty.jpg",
          height: height,
          width: width,
        );
      },
      placeholder: (context, _) {
        return ShimmerWidget(width: width, height: height, radius: radius);
      },
    );
  }
}
