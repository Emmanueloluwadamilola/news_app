import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/utils/util.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';
import 'package:news_app/features/favourite/presentation/manager/favourite_provider.dart';
import 'package:news_app/features/full_screen/presentation/screen/full_news_screen.dart';
import 'package:news_app/features/home/presentation/manager/home_provider.dart';
import 'package:news_app/features/home/presentation/screen/widgets/hot_news_widget.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  FavouriteProvider? _provider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _provider?.fetchFavouriteNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<FavouriteProvider>(builder: (_, provider, __) {
      _provider ??= provider;
      final state = provider.state;
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                AppToolBar(
                  title: 'Favourite',
                  isSuffix: true,
                  suffixIcon: Badge.count(
                    count: 0,
                    child: const SvgImage(
                      asset: icNotification,
                    ),
                  ),
                  suffixOnTap: () {},
                ),
                const Gap(20),
                state.isLoading
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                                5,
                                (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 200,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: theme.colorScheme.tertiary
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          const Gap(10),
                                          Container(
                                            height: 20,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: theme.colorScheme.tertiary
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          const Gap(10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  color: theme
                                                      .colorScheme.tertiary
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  color: theme
                                                      .colorScheme.tertiary
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                          .animate(
                                              onPlay: (controller) => controller
                                                  .repeat(reverse: true))
                                          .shimmer(
                                              delay: 400.ms,
                                              duration: 1800.ms,
                                              color: Colors.white),
                                    )),
                          ),
                        ),
                      )
                    : state.favouriteNews.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: SvgImage(
                                asset: icEmpty,
                                height: 200,
                              ),
                            ),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    state.favouriteNews.length, (index) {
                                  final favourite = state.favouriteNews[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 35),
                                    child: Clickable(
                                      onPressed: () {
                                        context.push(FullNewsScreen(
                                          newsSource: favourite.source,
                                          title: favourite.title!,
                                          content: favourite.content!,
                                          author: favourite.author,
                                          dateTime: formatTime(
                                              favourite.publishedAt!),
                                          url: favourite.url,
                                          imageUrl: favourite.urlToImage,
                                          date: favourite.publishedAt!,
                                        ));
                                      },
                                      child: HotNewsWidget(
                                        content: favourite.content!,
                                        imageUrl: favourite.urlToImage!,
                                        author: favourite.author!,
                                        title: favourite.title!,
                                        timeAgo:
                                            formatTime(favourite.publishedAt!),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
