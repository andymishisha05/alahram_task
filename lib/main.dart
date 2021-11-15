import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/place_ad.dart';
import '../screens/sub_categories_screen.dart';
import '../providers/category_provider.dart';
import '../screens/categories_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Categories())],
      child: MaterialApp(
        initialRoute: SpalshScreen.routeName,
        home: HomeScreen(),
        routes: {
          SpalshScreen.routeName: (ctx) => SpalshScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
          SubCategoriesScreen.routeName: (ctx) => SubCategoriesScreen(),
          PlaceAd.routeName: (ctx) => PlaceAd()
        },
      ),
    );
  }
}
