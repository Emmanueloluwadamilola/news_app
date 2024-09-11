import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
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
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<HomeProvider>(
      builder: (_, provider, __) {
        final state = provider.state;
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                top: 0,
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
                            'Hi, John',
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
                        count: 1,
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
                              'Hot News',
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
