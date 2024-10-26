import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:news_app/features/explore/presentation/screens/explore.dart';
import 'package:news_app/features/favourite/presentation/screens/favourite.dart';
import 'package:news_app/features/home/presentation/manager/index_provider.dart';
import 'package:news_app/features/home/presentation/screen/home_screen.dart';
import 'package:news_app/features/profile/presentation/screens/profile.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  static const id = 'index';
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => IndexProvider(),
      child: Consumer<IndexProvider>(
        builder: (_, provider, __) {
        
          return PopScope(
            canPop: provider.selectedIndex == 0,
            // ignore: deprecated_member_use
            onPopInvoked: (value) async {
              if (!value) {
                provider.setIndex(0);
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Column(
                children: [
                  Expanded(
                    child: _screens.elementAt(provider.selectedIndex),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavBar(
                selectedIndex: provider.selectedIndex,
                currentIndex: provider.selectedIndex,
                onTabSelected: (index) {
                  provider.setIndex(index);
                },
                items: [
                  for (final tabItem in BottomNavBarItem.items)
                    BottomNavBarItem(
                      text: tabItem.text,
                      icon: tabItem.icon,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
