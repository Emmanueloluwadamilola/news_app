import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/features/explore/presentation/manager/explore_provider.dart';
import 'package:provider/provider.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {super.key, required this.index, required this.isButtonSelected});
  final int index;
  final bool isButtonSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<ExploreProvider>(builder: (_, provider, __) {
      final state = provider.state;
      return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: isButtonSelected
                ? blueColor
                : const Color.fromARGB(
                    255,
                    242,
                    242,
                    247,
                  ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            state.newscategory[index],
            style: theme.textTheme.labelMedium!.copyWith(
              fontSize: 14,
              color: isButtonSelected
                  ? whiteColor
                  : const Color.fromARGB(
                      255,
                      168,
                      170,
                      177,
                    ),
            ),
          ),
        ),
      );
    });
  }
}
