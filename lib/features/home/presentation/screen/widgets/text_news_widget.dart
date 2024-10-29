import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/utils/util.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/features/full_screen/presentation/screen/full_news_screen.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';

class TextNewsWidget extends StatelessWidget {
  const TextNewsWidget({
    super.key,
    required this.forYou,
  });

  final Article forYou;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Clickable(
        onPressed: () {
          context.push(FullNewsScreen(
            newsSource:
                forYou.source.name ?? 'Full News',
            title: forYou.title!,
            content: forYou.content!,
            dateTime:
                formatTime(forYou.publishedAt!),
            imageUrl: forYou.urlToImage!,
            author: forYou.author ?? 'author',
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
                  fontSize: 17, color: darkText2),
        ),
      ),
    );
  }
}

