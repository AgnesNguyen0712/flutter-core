import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    this.width = double.infinity, 
    required this.height
  }) : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular({
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const CircleBorder()
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          width: this.width,
          height: this.height,
          decoration: ShapeDecoration(
            shape: this.shapeBorder,
            color: Colors.grey[400]
          ),
        ),
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!);
  }
}
