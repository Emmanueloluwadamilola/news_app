import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    this.isExplore = false,
    super.key,
    required this.imageUrl,
    required this.author,
    required this.title,
    required this.time,
  });
  final bool isExplore;
  final String imageUrl;
  final String author;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 120,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: whiteColor,
            ),
            child: imageUrl != 'null'
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  )
                : const CustomImage(
                    asset: imgNews,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
          ),
        ),
        const Gap(10),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 5,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: theme.textTheme.titleLarge!
                    .copyWith(fontSize: 18, color: darkText),
              ),
              const Gap(10),
            ],
          ),
        ),
        // Column(
        //   children: [
        //     Row(
        //       children: [
        //         Flexible(
        //           child: Column(
        //             children: [
        //               Text(
        //                 title,
        //                 maxLines: 2,
        //                 textAlign: TextAlign.justify,
        //                 overflow: TextOverflow.ellipsis,
        //                 softWrap: true,
        //                 style: theme.textTheme.titleLarge!
        //                     .copyWith(fontSize: 18, color: darkText),
        //               ),
        //               const Gap(10),
        //               Row(
        //                 children: [
        //                   Text(
        //                     author,
        //                     style: theme.textTheme.labelMedium!
        //                         .copyWith(fontSize: 14, color: darkText),
        //                   ),
        //                   // const Gap(10),
        //                   // Text(
        //                   //   time,
        //                   //   style: theme.textTheme.labelMedium!
        //                   //       .copyWith(fontSize: 12, color: whiteColor),
        //                   // ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         const Gap(10),
        //         // Container(
        //         //   height: 120,
        //         //   width: 120,
        //         //   decoration: BoxDecoration(
        //         //       borderRadius: BorderRadius.circular(12), color: blueColor),
        //         // )
        //       ],
        //     ),
        //   ],
        // ),
      ]),
    );
  }
}
