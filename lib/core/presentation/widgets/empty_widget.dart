import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key, this.height
  });
  final double? height;

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: SvgImage(
      asset: icEmpty,
      height: height ?? 150,
      //fit: BoxFit.scaleDown,
    ));
  }
}
