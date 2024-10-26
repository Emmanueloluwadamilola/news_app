import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/utils/util.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/news_card.dart';
import 'package:news_app/core/presentation/widgets/provider_widget.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';
import 'package:news_app/features/explore/presentation/manager/explore_provider.dart';
import 'package:news_app/features/explore/presentation/screens/widgets/category_button.dart';
import 'package:news_app/features/full_screen/presentation/screen/full_news_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ExploreProvider? _provider;
  FocusNode searchNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _provider?.fetchNewsCategory(
          _provider!.state.newscategory[_provider!.state.selectedIndex]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
        provider: ExploreProvider(),
        children: (provider, theme) {
          _provider ??= provider;
          final state = provider.state;

          return [
            AppToolBar(
              title: 'Explore',
              isSuffix: true,
              suffixIcon: Badge.count(
                count: 1,
                child: const SvgImage(
                  asset: icNotification,
                ),
              ),
              suffixOnTap: () {},
            ),
            const Gap(20),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 242, 247),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const SvgImage(asset: icSearch),
                  const Gap(15),
                  Expanded(
                      child: TextField(
                    onTapOutside: (event) {
                      setState(() {
                        searchNode.unfocus();
                      });
                    },
                    focusNode: searchNode,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 15),
                        border: InputBorder.none,
                        hintText: 'search using keywords',
                        hintStyle: theme.textTheme.labelMedium),
                    onChanged: (value) async {
                      await provider.setKeyword(value);
                      provider.fetchNewsByQuery();
                    },
                  )),
                ],
              ),
            ),
            const Gap(20),
            state.isSearching
                ? const Gap(0)
                : Column(
                    children: [
                      SizedBox(
                        height: 35,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.newscategory.length,
                            itemBuilder: (context, index) {
                              final category = state.newscategory[index];
                              return Clickable(
                                onPressed: () {
                                  provider.setIndex(index);
                                  provider.fetchNewsCategory(category);
                                },
                                child: CategoryButton(
                                  index: index,
                                  isButtonSelected:
                                      state.selectedIndex == index,
                                ),
                              );
                            }),
                      ),
                      const Gap(25),
                    ],
                  ),
            state.isLoading || state.isSearching
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(5, (index) {
                          return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: theme.colorScheme.tertiary
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  const Gap(10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.tertiary
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        const Gap(20),
                                        Container(
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.tertiary
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                                  .animate(
                                      onPlay: (controller) =>
                                          controller.repeat(reverse: true))
                                  .shimmer(
                                      delay: 400.ms,
                                      duration: 1800.ms,
                                      color: Colors.white));
                        }),
                      ),
                    ),
                  )
                : state.newsFeed.isEmpty
                    ? const Expanded(
                        child: Center(
                        child: SvgImage(
                          asset: icEmpty,
                          height: 200,
                          //fit: BoxFit.scaleDown,
                        ),
                      ))
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children:
                                List.generate(state.newsFeed.length, (index) {
                              final news = state.newsFeed[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Clickable(
                                  onPressed: () {
                                    context.push(FullNewsScreen(
                                      newsSource: news.source.name!,
                                      title: news.title!,
                                      content: news.content!,
                                      author: news.author,
                                      dateTime: formatTime(news.publishedAt!),
                                      url: news.url,
                                      imageUrl: news.urlToImage,
                                      date: news.publishedAt!,
                                    ));
                                  },
                                  child: NewsCardWidget(
                                    isExplore: true,
                                    imageUrl: news.urlToImage!,
                                    author: news.author!,
                                    title: news.title!,
                                    time: formatTime(news.publishedAt!),
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
