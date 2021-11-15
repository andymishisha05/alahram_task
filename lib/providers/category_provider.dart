import 'package:flutter/foundation.dart' show ChangeNotifier;
import '../models/category.dart';

class Categories with ChangeNotifier {
  Category? _selectedCategory;
  final _categories = [
    Category(
        id: 1,
        title: 'Vehicles',
        description: 'New , For Sale ,For Rent',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/575/575780.png',
        subCategoryList: [
          Category(
              id: 2,
              title: 'Cars',
              description: 'Cars ,Parts,Accessories',
              imageUrl:
                  'https://img.lovepik.com/free-png/20210926/lovepik-car-icon-png-image_401452256_wh1200.png',
              subCategoryList: []),
          Category(
              id: 3,
              title: 'Metorcycles',
              description: 'Metorcycles ,Parts,Accessories',
              imageUrl:
                  'https://toppng.com/uploads/preview/motorcycle-vector-motorcycle-icon-green-11553385671oh71jgphxf.png',
              subCategoryList: [])
        ]),
    Category(
        id: 4,
        title: 'Properties',
        description: 'For Sale , For Rent, Wanted',
        imageUrl:
            'https://cdn2.iconfinder.com/data/icons/real-estate-60/300/23-512.png',
        subCategoryList: [
          Category(
              id: 5,
              title: 'Apartments',
              description: 'Apartments',
              imageUrl:
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngaaa.com%2Fdetail%2F2498094&psig=AOvVaw1z25lgE7Ek46OQeM96eEKa&ust=1636958513905000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNDs9Oufl_QCFQAAAAAdAAAAABAD',
              subCategoryList: [])
        ])
  ];

  List<Category> get items {
    return _categories;
  }

  Category? get selectedCategory {
    return _selectedCategory;
  }

  List<Category> getSubItems(int id) {
    return items.firstWhere((element) => id == element.id).subCategoryList;
  }

  void selectCategory(Category? parentCategory, subCategory) {
    _selectedCategory = parentCategory;
    _selectedCategory!.selectedSubCategory = subCategory;
    notifyListeners();
  }
}
