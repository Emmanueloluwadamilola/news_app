import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';

class DashboardProfileImage extends StatelessWidget {
  const DashboardProfileImage(
      {super.key, required this.asset, this.height, this.width, this.network});
  final String asset;
  final String? network;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        shape: BoxShape.circle,
      ),
      child: Container(
        height: height ?? 90,
        width: width ?? 90,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: network == null
            ? CustomImage(
                asset: asset,
                fit: BoxFit.fitWidth,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  network!,
                  fit: BoxFit.fitWidth,
                  // loadingBuilder: (context, child, loadingProgress) {
                  //   return Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Center(
                  //       child: CircularProgressIndicator(
                  //         color: theme.colorScheme.tertiary,
                  //       ),
                  //     ),
                  //   );
                  // },
                ),
              ),
      ),
    );
  }
}
