import 'package:flutter/material.dart';
import 'package:jioyathri/features/categories/presentation/pages/categories_screen.dart';
import 'package:jioyathri/features/favorities/presentation/pages/favorities_screen.dart';
import 'package:jioyathri/features/profile/presentation/pages/profile_screen.dart';
import 'package:jioyathri/features/search/presentation/pages/search_Screen.dart';
import 'package:jioyathri/features/services/presentation/pages/services.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageState();
}

class _HomepageState extends State<HomepageScreen> {
  List<Widget> screens = [
    Services(),
    CategoriesScreen(),
    SearchScreen(),
    FavoritiesScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
