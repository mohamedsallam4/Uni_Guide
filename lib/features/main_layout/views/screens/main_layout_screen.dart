import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/main_layout_cubit.dart';
import '../../cubit/main_layout_state.dart';
import '../../models/navigation_item.dart';
import '../../../home/views/screens/home_screen.dart';
import '../../../directory/views/screens/directory_screen.dart';
import '../../../comparison/views/screens/comparison_screen.dart';
import '../../../ai_counselor/views/screens/ai_counselor_screen.dart';
import '../../../matchmaking/views/screens/matchmaking_screen.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  static const List<NavigationItem> _navigationItems = [
    NavigationItem(label: 'Home', icon: Icons.home, route: '/home'),
    NavigationItem(label: 'Directory', icon: Icons.school, route: '/directory'),
    NavigationItem(label: 'Compare', icon: Icons.compare, route: '/comparison'),
    NavigationItem(label: 'AI Counselor', icon: Icons.chat, route: '/ai_counselor'),
    NavigationItem(label: 'Match', icon: Icons.favorite, route: '/matchmaking'),
  ];

  static const List<Widget> _screens = [
    HomeScreen(),
    DirectoryScreen(),
    ComparisonScreen(),
    AiCounselorScreen(),
    MatchmakingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit, MainLayoutState>(
      builder: (context, state) {
        final selectedIndex = (state is MainLayoutLoaded) ? state.selectedIndex : 0;

        return Scaffold(
          body: _screens[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              context.read<MainLayoutCubit>().changeTab(index);
            },
            items: _navigationItems
                .map((item) => BottomNavigationBarItem(
                      icon: Icon(item.icon),
                      label: item.label,
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}