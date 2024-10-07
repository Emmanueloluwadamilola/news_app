import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/util.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';
import 'package:news_app/features/favourite/presentation/manager/favourite_provider.dart';
import 'package:news_app/features/home/presentation/manager/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FullNewsScreen extends StatefulWidget {
  static const id = 'full-news';
  const FullNewsScreen(
      {super.key,
      required this.newsSource,
      required this.title,
      required this.content,
      required this.author,
      required this.dateTime,
      required this.url,
      required this.date,
      required this.imageUrl});
  final String newsSource;
  final String title;
  final String? author;
  final String content;
  final String? dateTime;
  final String? imageUrl;
  final String? url;
  final DateTime? date;
  // final String ;

  @override
  State<FullNewsScreen> createState() => _FullNewsScreenState();
}

class _FullNewsScreenState extends State<FullNewsScreen> {
  HomeProvider? _provider;
  FavouriteProvider? _favouriteProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _favouriteProvider?.setFavourite(title: widget.title);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer2<HomeProvider, FavouriteProvider>(
        builder: (_, provider, favouriteProvider, __) {
      _provider ??= provider;
      _favouriteProvider ??= favouriteProvider;
      final favouriteState = favouriteProvider.state;
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              AppToolBar(
                  title: widget.newsSource,
                  isPrefix: true,
                  isSuffix: true,
                  suffixOnTap: () {},
                  suffixIcon: Row(
                    children: [
                      Clickable(
                        onPressed: () {
                          favouriteState.isFavourite
                              ? favouriteProvider.deleteFavourite(
                                  title: widget.title)
                              : favouriteProvider.addFavourite(
                                  source: widget.newsSource,
                                  title: widget.title,
                                  content: widget.content,
                                  author: widget.author ?? 'author',
                                  url: widget.url ?? '',
                                  urlToImage: widget.imageUrl ?? '',
                                  publishedAt: widget.date!);
                        },
                        child: Icon(
                          favouriteState.isFavourite
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                          color:
                              favouriteState.isFavourite ? blueColor : darkText,
                        ),
                      ),
                      const Gap(20),
                      Clickable(
                          onPressed: () {
                            provider.shareNews(widget.url!);
                          },
                          child: const Icon(Icons.share))
                    ],
                  )
                  // PopupMenuButton(
                  //     icon: const Icon(
                  //       Icons.more_vert,
                  //       color: darkText,
                  //     ),
                  //     itemBuilder: (context) => [
                  //           PopupMenuItem(
                  //               onTap: () {
                  //                 favouriteProvider.addFavourite(
                  //                   source: widget.newsSource,
                  //                   title: widget.title,
                  //                   content: widget.content,
                  //                   author: widget.author!,
                  //                   url: widget.url!,
                  //                   urlToImage: widget.imageUrl!,
                  //                   publishedAt: widget.date!,
                  //                 );
                  //               },
                  //               child: const Row(
                  //                 children: [
                  //                   SvgImage(
                  //                     asset: icFavourite,
                  //                     fit: BoxFit.scaleDown,
                  //                     color: darkText,
                  //                   ),
                  //                   Gap(10),
                  //                   Text('Add to Favourite'),
                  //                 ],
                  //               )),
                  //           PopupMenuItem(
                  //             onTap: () {
                  //               provider.shareNews(widget.url!);
                  //             },
                  //             child: const Row(
                  //               children: [
                  //                 Icon(
                  //                   Icons.share_outlined,
                  //                   color: darkText,
                  //                 ),
                  //                 Gap(10),
                  //                 Text('Share'),
                  //               ],
                  //             ),
                  //           ),
                  //         ]),
                  ),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        // maxLines: 2,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        widget.author ?? 'author',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: theme.textTheme.labelMedium!.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Text(
                            formattedDate(widget.date!) ?? '',
                            style: theme.textTheme.labelMedium!.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Hero(
                        tag: widget.imageUrl!,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            //  258,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                16,
                              ),
                            ),
                            child: widget.imageUrl != 'null'
                                ? Image.network(
                                    widget.imageUrl!,
                                    fit: BoxFit.fill,
                                  )
                                : const CustomImage(
                                    asset: imgNews,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      Text(
                        widget.content,
                        style: theme.textTheme.labelMedium!.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const Gap(40),
                      CustomButton(
                          onTap: () async {
                            widget.url == 'null' || widget.url == null
                                ? () {}
                                : await launchUrl(Uri.parse(
                                    widget.url ?? 'https://google.com'));
                          },
                          title: 'Read more')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
