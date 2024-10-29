import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/utils/util.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/empty_widget.dart';
import 'package:news_app/core/presentation/widgets/provider_widget.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';
import 'package:news_app/features/favourite/presentation/manager/favourite_provider.dart';
import 'package:news_app/features/favourite/presentation/screens/widget/favourite_shimmer.dart';
import 'package:news_app/features/full_screen/presentation/screen/full_news_screen.dart';
import 'package:news_app/features/home/presentation/screen/widgets/hot_news_widget.dart';

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
    return ConsumerWidget(
        provider: FavouriteProvider(),
        children: (provider, theme) {
          _provider ??= provider;
          final state = provider.state;
          return [
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
                            5, (index) => const FavouriteNewsShimmer()),
                      ),
                    ),
                  )
                : state.favouriteNews.isEmpty
                    ? const Expanded(
                        child: 
                        EmptyWidget(height: 200,),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(state.favouriteNews.length,
                                (index) {
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
                                      dateTime:
                                          formatTime(favourite.publishedAt!),
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
                                    timeAgo: formatTime(favourite.publishedAt!),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
          ];
        });
  }
}

