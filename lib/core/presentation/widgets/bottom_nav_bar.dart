
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';
import 'package:sprung/sprung.dart';

class BottomNavBarItem {
  BottomNavBarItem({
    this.icon,
    required this.text,
  });

  String? icon;
  String text;

  static List<BottomNavBarItem> get items => [
        BottomNavBarItem(
          text: 'Home',
          icon: icHome,
        ),
        BottomNavBarItem(
          text: 'Explore',
          icon: icExplore,
        ),
      
        BottomNavBarItem(
          text: 'Favourite',
          icon: icFavourite,
        ),
        BottomNavBarItem(
          text: 'Profile',
          icon: icProfile,
        ),
      ];
}

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.currentIndex,
    this.items,
    this.selectedItems,
    this.height = 80.0,
    this.iconSize = 24.0,
    this.onTabSelected,
  }) {
    assert(items?.length == 2 || items?.length == 5);
  }

  final List<BottomNavBarItem>? items;
  final List<BottomNavBarItem>? selectedItems;
  final double? height;
  final double? iconSize;
  final ValueChanged<int>? onTabSelected;
  final int selectedIndex;
  final int currentIndex;

  @override
  State<StatefulWidget> createState() =>
      // ignore: no_logic_in_create_state
      _BottomNavBarState(selectedIndex: selectedIndex);
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  var selectedIndex = 0;

  _BottomNavBarState({required this.selectedIndex});

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  _updateIndex(int index) {
    widget.onTabSelected!(index);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Widget> items = List.generate(
      widget.items!.length,
      (int index) {
        return _buildTabItem(
          item: widget.items![index],
          index: index,
          onPressed: _updateIndex,
          theme: theme,
        );
      },
    );

    return Container(
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            width: 1,
            color: Color(0XFFDEDFE0),
            //theme.colorScheme.secondary,
          ),
        ),
      ),
      child: BottomAppBar(
        color: theme.colorScheme.surface,
        height: widget.height,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required BottomNavBarItem item,
    required ThemeData theme,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    return Clickable(
      onPressed: () {
        // HapticFeedback.lightImpact();
        onPressed(index);
      },
      child: AnimatedContainer(
        height: widget.height,
        duration: const Duration(milliseconds: 500),
        curve: Sprung.underDamped,
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 1.0,
            end: 1.5,
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Sprung.underDamped,
            ),
          ),
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgImage(
                  asset: item.icon!,
                  height: 24,
                  color: widget.currentIndex == index
                      ? theme.colorScheme.primary
                      : theme.colorScheme.tertiary,
                ),
                const Gap(4),
                Text(
                  item.text,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    fontWeight: widget.currentIndex == index
                        ? FontWeight.w700
                        : FontWeight.w400,
                    color: widget.currentIndex == index
                        ? theme.colorScheme.primary
                        : theme.colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
