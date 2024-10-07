import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/utils/util.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';
import 'package:news_app/features/home/presentation/manager/home_provider.dart';
import 'package:news_app/features/full_screen/presentation/screen/full_news_screen.dart';
import 'package:news_app/features/home/presentation/screen/widgets/hot_news_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? _provider;
  int selectedIndex = 0;
  int currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _provider?.fetchNews();
      _provider?.fetchNewsSource();
      // await _provider?.fetchLatestNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<HomeProvider>(
      builder: (_, provider, __) {
        _provider ??= provider;
        final state = provider.state;
        final breakingNews = state.breakingNews;
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[100],
                        child: const SvgImage(
                          asset: icProfile,
                          color: blueColor,
                        ),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, ${state.userName ?? ''}',
                            style: theme.textTheme.titleLarge!.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            'Reading keeps you informed',
                            style: theme.textTheme.labelMedium!.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Badge.count(
                        count: 0,
                        child: const SvgImage(
                          asset: icNotification,
                        ),
                      )
                    ],
                  ),
                  const Gap(30),
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Latest News',
                              style: theme.textTheme.titleLarge!
                                  .copyWith(fontSize: 20, color: blueColor),
                            ),
                            Text(
                              'See All',
                              style: theme.textTheme.titleLarge!.copyWith(
                                fontSize: 14,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                        const Gap(15),
                        state.isLoading && breakingNews.isEmpty
                            ? 
                            Column(
                                children: [
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
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
                                      borderRadius: BorderRadius.circular(8),
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
                                          color: theme.colorScheme.tertiary
                                              .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.tertiary
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
                                    onPlay: (controller) =>
                                        controller.repeat(reverse: true))
                                .shimmer(
                                    delay: 400.ms,
                                    duration: 1800.ms,
                                    color: Colors.white)
                            : breakingNews.isEmpty
                                ? const Center(
                                    child: SvgImage(
                                      asset: icEmpty,
                                      height: 150,
                                      //fit: BoxFit.scaleDown,
                                    ),
                                  )
                                : Column(
                                    children: [
                                      CarouselSlider(
                                        options: CarouselOptions(
                                          viewportFraction: 1,
                                          height: 300,
                                          autoPlay: true,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              currentIndex = index;
                                            });
                                          },
                                        ),
                                        items: breakingNews
                                            .map(
                                              (item) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: SizedBox(
                                                  height: 300,
                                                  width: double.infinity,
                                                  child: Clickable(
                                                    onPressed: () {
                                                      context
                                                          .push(FullNewsScreen(
                                                        newsSource:
                                                            item.source.name ??
                                                                'Full News',
                                                        title: item.title!,
                                                        content: item.content ??
                                                            'content',
                                                        dateTime: formatTime(
                                                            item.publishedAt!),
                                                        imageUrl:
                                                            item.urlToImage!,
                                                        author: item.author ??
                                                            'author',
                                                        url: item.url,
                                                        date: item.publishedAt,
                                                      ));
                                                    },
                                                    child: HotNewsWidget(
                                                      content: item.content ??
                                                          'content',
                                                      title:
                                                          item.title ?? 'title',
                                                      author: item.author ??
                                                          'author',
                                                      imageUrl: item.urlToImage,
                                                      timeAgo: formatTime(
                                                          item.publishedAt!),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                      const Gap(5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                            breakingNews.length, (index) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(right: 3),
                                            child: Container(
                                              height: 6,
                                              width: index == currentIndex
                                                  ? 12
                                                  : 8,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: index == currentIndex
                                                    ? blueColor
                                                    : theme.colorScheme.tertiary
                                                        .withOpacity(0.5),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                        const Gap(30),
                        Text(
                          'Check this headlines',
                          style: theme.textTheme.titleLarge!
                              .copyWith(fontSize: 20, color: blueColor),
                        ),
                        const Gap(15),
                        state.isLoading && state.forYou.isEmpty
                            ? Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.tertiary
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const Gap(10),
                                  Container(
                                    height: 20,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.tertiary
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const Gap(25),
                                  Container(
                                    height: 20,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.tertiary
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const Gap(10),
                                  Container(
                                    height: 20,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.tertiary
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const Gap(35),
                                  Container(
                                    height: 20,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.tertiary
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const Gap(10),
                                  Container(
                                    height: 20,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.tertiary
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const Gap(15),
                                ],
                              )
                                .animate(
                                    onPlay: (controller) =>
                                        controller.repeat(reverse: true))
                                .shimmer(
                                    delay: 400.ms,
                                    duration: 1800.ms,
                                    color: Colors.white)
                            : state.forYou.isEmpty
                                ? const Center(
                                    child: SvgImage(
                                      asset: icEmpty,
                                      height: 150,
                                      //fit: BoxFit.scaleDown,
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(state.forYou.length,
                                        (index) {
                                      final forYou = state.forYou[index];
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 30),
                                        child: Clickable(
                                          onPressed: () {
                                            context.push(FullNewsScreen(
                                              newsSource:
                                                  forYou.source.name ??
                                                      'Full News',
                                              title: forYou.title!,
                                              content: forYou.content!,
                                              dateTime: formatTime(
                                                  forYou.publishedAt!),
                                              imageUrl:
                                                  forYou.urlToImage!,
                                              author: forYou.author ??
                                                  'author',
                                              url: forYou.url,
                                              date: forYou.publishedAt,
                                            ));
                                          },
                                          child: Text(
                                            forYou.title!,
                                            maxLines: 3,
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: theme.textTheme.titleLarge!
                                                .copyWith(
                                                    fontSize: 17,
                                                    color: darkText2),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                        const Gap(15),
                        Text(
                          'Popular Media',
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                            color: blueColor,
                          ),
                        ),
                        const Gap(20),
                        state.newsSorceLoading
                            ? Wrap(
                                children: List.generate(5, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, bottom: 10),
                                    child: Container(
                                      height: 25,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: theme.colorScheme.tertiary
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    )
                                        .animate(
                                            onPlay: (controller) => controller
                                                .repeat(reverse: true))
                                        .shimmer(
                                            delay: 400.ms,
                                            duration: 1800.ms,
                                            color: Colors.white),
                                  );
                                }),
                              )
                            : state.newsMedia.isEmpty
                                ? const Center(
                                    child: SvgImage(
                                    asset: icEmpty,
                                    height: 150,
                                    //fit: BoxFit.scaleDown,
                                  ))
                                : Wrap(
                                    children: List.generate(
                                        state.newsMedia.length, (index) {
                                      final source = state.newsMedia[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, bottom: 15),
                                        child: Clickable(
                                          onPressed: () async {
                                            source.url == 'null'
                                                ? () {}
                                                : await launchUrl(
                                                    Uri.parse(source.url));
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 8),
                                            decoration: BoxDecoration(
                                                color: theme
                                                    .colorScheme.tertiary
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Text(
                                              state.newsMedia[index].name,
                                              style: theme.textTheme.titleLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color: darkText),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                        const Gap(20),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
