import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';
import 'package:news_app/features/explore/presentation/manager/explore_provider.dart';
import 'package:news_app/features/explore/presentation/screens/widgets/category_button.dart';
import 'package:news_app/features/home/presentation/screen/widgets/hot_news_widget.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<ExploreProvider>(builder: (_, provider, __) {
      final state = provider.state;
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
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
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 15),
                                    border: InputBorder.none,
                                    hintText: 'search using keywords',
                                    hintStyle: theme.textTheme.labelMedium),
                              )),
                            ],
                          ),
                        ),
                        const Gap(20),
                        SizedBox(
                          height: 35,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.newscategory.length,
                              itemBuilder: (context, index) {
                                return Clickable(
                                  onPressed: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: CategoryButton(
                                    index: index,
                                    isButtonSelected: selectedIndex == index,
                                  ),
                                );
                              }),
                        ),
                        const Gap(25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trending Topic',
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
                        SizedBox(
                          height: 280,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return const HotNewsWidget();
                              }),
                        ),
                        const Gap(15),
                        Text(
                          'Popular Media',
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                          ),
                        ),
                        const Gap(20),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.newsMedia.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Column(
                                    children: [
                                      Clickable(
                                          onPressed: () {},
                                          child: Container(
                                            height: 70,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                                color: Color(0xFFF2F2F7),
                                                shape: BoxShape.circle),
                                            child: Center(
                                                child: Icon(
                                              Icons.public,
                                              size: 35,
                                            )),
                                          )),
                                      const Gap(5),
                                      Text(
                                        state.newsMedia[index],
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        const Gap(30),
                      ],
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
