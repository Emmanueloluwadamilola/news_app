import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/empty_widget.dart';
import 'package:news_app/core/presentation/widgets/provider_widget.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';
import 'package:news_app/features/home/domain/util/util.dart';
import 'package:news_app/features/home/presentation/manager/home_provider.dart';
import 'package:news_app/features/home/presentation/screen/widgets/news_caurosel_widget.dart';
import 'package:news_app/features/home/presentation/screen/widgets/news_shimmer.dart';
import 'package:news_app/features/home/presentation/screen/widgets/news_source_card.dart';
import 'package:news_app/features/home/presentation/screen/widgets/text_news_widget.dart';
import 'package:news_app/features/profile/presentation/screens/widgets/profile_image.dart';

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
      if (initials.isEmpty) {
        _provider?.getInitials();
      }

      await _provider?.fetchNews();
      _provider?.fetchNewsSource();
      // await _provider?.fetchLatestNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
        vertPadding: 8,
        provider: HomeProvider(),
        children: (provider, theme) {
          _provider ??= provider;
          final state = provider.state;
          final breakingNews = state.breakingNews;
          return [
            Row(
              children: [
                ProfileImage(
                  initials: initials,
                  height: 50,
                  width: 50,
                  fontSize: 18,
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
                      ? const LatestNewsShimmer()
                      : breakingNews.isEmpty
                          ? const EmptyWidget()
                          : NewsCauroselWidget(
                              breakingNews: breakingNews,
                            ),
                  const Gap(30),
                  Text(
                    'Check this headlines',
                    style: theme.textTheme.titleLarge!
                        .copyWith(fontSize: 20, color: blueColor),
                  ),
                  const Gap(15),
                  state.isLoading && state.forYou.isEmpty
                      ? const TextShimmer()
                      : state.forYou.isEmpty
                          ? const EmptyWidget()
                          :
                          // : AnimatedList(
                          //   initialItemCount: state.forYou.length,
                          //     itemBuilder: (context, index, animation) {
                          //        final forYou = state.forYou[index];
                          //     return SlideTransition(
                          //         position: Tween<Offset>(
                          //       begin:
                          //           const Offset(1.0, 0.0), // Slide in from the right
                          //       end: const Offset(0.0, 0.0),
                          //     ).animate(animation), child: TextNewsWidget(forYou: forYou),);
                          //   }),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  List.generate(state.forYou.length, (index) {
                                final forYou = state.forYou[index];
                                return TextNewsWidget(forYou: forYou);
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
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
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
                                      onPlay: (controller) =>
                                          controller.repeat(reverse: true))
                                  .shimmer(
                                      delay: 400.ms,
                                      duration: 1800.ms,
                                      color: Colors.white),
                            );
                          }),
                        )
                      : state.newsMedia.isEmpty
                          ? const EmptyWidget()
                          : Wrap(
                              children: List.generate(state.newsMedia.length,
                                  (index) {
                                final source = state.newsMedia[index];
                                return NewsSourceCard(
                                  source: source,
                                );
                              }),
                            ),
                  const Gap(20),
                ],
              )),
            ),
          ];
        });
  }
}
