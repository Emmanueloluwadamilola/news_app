import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/news_card.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
          child: Column(
            children: [
              AppToolBar(
                title: 'Favourite',
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
                    children: List.generate(10, (index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: NewsCardWidget());
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
