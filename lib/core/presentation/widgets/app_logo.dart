import 'package:flutter/widgets.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: blueColor,
        ),
        child: const Center(child: CustomImage(asset: imgAppLogo)));
  }
}
