import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suiiz_clone/models/category.dart';
import 'package:suiiz_clone/providers/category_provider.dart';

// ignore: must_be_immutable
class SubCategoriesScreen extends StatelessWidget {
  static const routeName = '/sub_category';
  Category? mainCategory;

  @override
  Widget build(BuildContext context) {
    print("object");
    mainCategory = ModalRoute.of(context)!.settings.arguments as Category;
    final cats_provider = Provider.of<Categories>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(mainCategory!.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cats_provider.getSubItems(mainCategory!.id).length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {
                mainCategory!.selectedSubCategory =
                    cats_provider.getSubItems(mainCategory!.id)[index];
                cats_provider.selectCategory(mainCategory!,
                    cats_provider.getSubItems(mainCategory!.id)[index]);
                Navigator.of(context).pop();
              },
              leading: Container(
                width: 60,
                height: 60,
                child: Image.network(
                  cats_provider.getSubItems(mainCategory!.id)[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                  cats_provider.getSubItems(mainCategory!.id)[index].title),
              subtitle: Text(cats_provider
                  .getSubItems(mainCategory!.id)[index]
                  .description),
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
