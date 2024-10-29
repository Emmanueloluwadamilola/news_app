
import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/features/home/domain/entities/model/news_source.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsSourceCard extends StatelessWidget {
  const NewsSourceCard({
    super.key,
    required this.source,
  
  });

  final NewsSource source;
  

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 15),
      child: Clickable(
        onPressed: () async {
          source.url == 'null' ? () {} : await launchUrl(Uri.parse(source.url));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
              color: theme.colorScheme.tertiary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            source.name,
            style: theme.textTheme.titleLarge!
                .copyWith(fontSize: 16, color: darkText),
          ),
        ),
      ),
    );
  }
}
