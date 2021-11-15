import 'package:flutter/material.dart';
import 'package:suiiz_clone/screens/categories_screen.dart';
import 'package:suiiz_clone/screens/place_ad.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _pages = [
    CategoriesScreen(),
    Icon(
      Icons.message,
      size: 100,
    )
  ];
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.category,
                color: _selectedIndex == 0 ? Colors.purple : Colors.black54,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            SizedBox(width: 48.0),
            IconButton(
              icon: Icon(
                Icons.message,
                color: _selectedIndex == 1 ? Colors.purple : Colors.black54,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(PlaceAd.routeName);
        },
      ),
    );
  }
}
