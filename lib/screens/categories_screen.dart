import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';
import '../screens/sub_categories_screen.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';
  bool navigateback = false;
  CategoriesScreen({this.navigateback = false});
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context, listen: false).items;
    if (ModalRoute.of(context)?.settings != null &&
        ModalRoute.of(context)?.settings.arguments != null) {
      navigateback = ModalRoute.of(context)!.settings.arguments as bool;
    }
    return Scaffold(
      appBar: AppBar(title: Text("Category"), centerTitle: true),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {
                if (navigateback) {
                  print('Tapped  ${navigateback}');

                  Navigator.of(context)
                      .pushNamed(SubCategoriesScreen.routeName,
                          arguments: categories[index])
                      .catchError((onError) {
                    print(onError.toString());
                  }).then((value) => Navigator.of(context).pop(value));
                }
              },
              leading: Image.network(
                categories[index].imageUrl,
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
              title: Text(categories[index].title),
              subtitle: Text(categories[index].description),
              trailing: Icon(Icons.arrow_right),
            ),
            margin: EdgeInsets.fromLTRB(20, 16, 20, 0),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                border: Border.all(
                  color: Colors.black54,
                  width: 1,
                )),
          );
        },
      ),
    );
  }
}
