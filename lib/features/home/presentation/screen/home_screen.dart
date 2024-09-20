import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/util.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';
import 'package:news_app/core/presentation/widgets/news_card.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';
import 'package:news_app/features/home/presentation/manager/home_provider.dart';
import 'package:news_app/features/home/presentation/screen/widgets/hot_news_widget.dart';
import 'package:provider/provider.dart';

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
    });
    // TODO: implement initState
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Latest News',
                              style: theme.textTheme.titleLarge!.copyWith(
                                fontSize: 20,
                              ),
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
                            ? Column(
                                children: [
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: theme.colorScheme.tertiary,
                                    ),
                                  ),
                                     
                                  const Gap(10),
                                  Container(
                                    height: 20,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.tertiary,
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
                                          color: theme.colorScheme.tertiary,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.tertiary,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ) .animate(
                                          onPlay: (controller) =>
                                              controller.repeat(reverse: true))
                                      .shimmer(
                                          delay: 400.ms,
                                          duration: 1800.ms,
                                          color: Colors.white)
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
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: SizedBox(
                                              height: 300,
                                              width: double.infinity,
                                              child: HotNewsWidget(
                                                title: item.title ?? 'title',
                                                author: item.author ?? 'author',
                                                imageUrl: item.urlToImage!,
                                                timeAgo: formatTime(
                                                    item.publishedAt!),
                                              ),
                                            ),
                                            //  CustomImage(
                                            //   fit: BoxFit.fill,
                                            //   height: 65,
                                            //   width: double.infinity,
                                            //   asset: item,
                                            // ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const Gap(5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(breakingNews.length,
                                        (index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 3),
                                        child: Container(
                                          height: 6,
                                          width: index == currentIndex ? 12 : 8,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: index == currentIndex
                                                ? blueColor
                                                : theme.colorScheme.tertiary,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                        const Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'For you',
                              style: theme.textTheme.titleLarge!.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            // Text(
                            //   'See All',
                            //   style: theme.textTheme.titleLarge!.copyWith(
                            //     fontSize: 14,
                            //     color: blueColor,
                            //   ),
                            // ),
                          ],
                        ),
                        const Gap(15),
                        // SizedBox(
                        //   height: 35,
                        //   child: ListView.builder(
                        //       physics: const BouncingScrollPhysics(),
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: state.newscategory.length,
                        //       itemBuilder: (context, index) {
                        //         return
                        //         Padding(
                        //           padding: const EdgeInsets.only(right: 16),
                        //           child: GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 selectedIndex = index;
                        //               });
                        //             },
                        //             child: Container(
                        //               padding: const EdgeInsets.symmetric(
                        //                 vertical: 8,
                        //                 horizontal: 20,
                        //               ),
                        //               decoration: BoxDecoration(
                        //                 color: selectedIndex == index
                        //                     ? Colors.black
                        //                     : const Color.fromARGB(
                        //                         255,
                        //                         242,
                        //                         242,
                        //                         247,
                        //                       ),
                        //                 borderRadius: BorderRadius.circular(30),
                        //               ),
                        //               child: Text(
                        //                 state.newscategory[index],
                        //                 style:
                        //                     theme.textTheme.labelMedium!.copyWith(
                        //                   fontSize: 14,
                        //                   color: selectedIndex == index
                        //                       ? whiteColor
                        //                       : const Color.fromARGB(
                        //                           255,
                        //                           168,
                        //                           170,
                        //                           177,
                        //                         ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         );

                        //       }),
                        // ),
                        // const Gap(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(10, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: NewsCardWidget(),
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
