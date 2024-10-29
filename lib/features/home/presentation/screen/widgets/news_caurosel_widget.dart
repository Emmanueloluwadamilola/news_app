import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/utils/util.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/features/full_screen/presentation/screen/full_news_screen.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';
import 'package:news_app/features/home/presentation/screen/widgets/hot_news_widget.dart';

class NewsCauroselWidget extends StatefulWidget {
  const NewsCauroselWidget({super.key, required this.breakingNews});
  final List<Article> breakingNews;

  @override
  State<NewsCauroselWidget> createState() => _NewsCauroselWidgetState();
}

class _NewsCauroselWidgetState extends State<NewsCauroselWidget> {
  int selectedIndex = 0;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
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
          items: widget.breakingNews
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Clickable(
                      onPressed: () {
                        context.push(FullNewsScreen(
                          newsSource: item.source.name ?? 'Full News',
                          title: item.title!,
                          content: item.content ?? 'content',
                          dateTime: formatTime(item.publishedAt!),
                          imageUrl: item.urlToImage!,
                          author: item.author ?? 'author',
                          url: item.url,
                          date: item.publishedAt,
                        ));
                      },
                      child: HotNewsWidget(
                        content: item.content ?? 'content',
                        title: item.title ?? 'title',
                        author: item.author ?? 'author',
                        imageUrl: item.urlToImage,
                        timeAgo: formatTime(item.publishedAt!),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.breakingNews.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 3),
              child: Container(
                height: 6,
                width: index == currentIndex ? 12 : 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: index == currentIndex
                      ? blueColor
                      : theme.colorScheme.tertiary.withOpacity(0.5),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
