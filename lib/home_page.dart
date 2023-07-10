import 'package:flutter/material.dart';
import 'package:instagram_ui/pages/export.dart';
import 'package:instagram_ui/utils/avatar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _children = [Home(), Search(), Reels(), Shop(), Account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 58,
        child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            elevation: 0,
            onTap: _navigateBottomNavBar,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('images/home.png'),
                    size: 24,
                  ),
                  activeIcon: ImageIcon(
                    AssetImage('images/home_fill.png'),
                    size: 24,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('images/search.png'),
                    size: 24,
                  ),
                  activeIcon: ImageIcon(
                    AssetImage('images/search_fill.png'),
                    size: 24,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('images/video.png'),
                    size: 24,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('images/heart.png'),
                    size: 24,
                  ),
                  activeIcon: ImageIcon(
                    AssetImage('images/heart_full.png'),
                    size: 24,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Avatar.bottomBar(),
                  activeIcon: AvatarCover.bottomBar(),
                  label: ''),
            ]),
      ),
    );
  }
}
