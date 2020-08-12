import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
  TabsScreen(this.favouriteMeals);
  final List<Meal> favouriteMeals;
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedScreenIndex = 0;
  _selectedScreen(index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoryScreen(), 'title': 'Meal Categories'},
      {'page': FavouriteScreen(widget.favouriteMeals), 'title': 'Favourite'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_pages[_selectedScreenIndex]['title']}'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
        elevation: 5,
      ),
      body: _pages[_selectedScreenIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favourite'),
          ),
        ],
        onTap: _selectedScreen,
      ),
    );
  }
}
