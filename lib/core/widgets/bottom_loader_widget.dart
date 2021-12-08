import 'package:flutter/material.dart';

class BottomLoaderWidget extends StatelessWidget {
  final double strokeWidth;
  BottomLoaderWidget({this.strokeWidth = 3});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: this.strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).colorScheme.secondaryVariant),
      ),
    );
  }
}
