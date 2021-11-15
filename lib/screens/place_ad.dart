import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:suiiz_clone/models/category.dart';
import 'package:suiiz_clone/screens/categories_screen.dart';
import '../widgets/attach_image_ad.dart';
import '../providers/category_provider.dart';

class PlaceAd extends StatefulWidget {
  static const routeName = '/place-ad';

  @override
  _PlaceAdState createState() => _PlaceAdState();
}

class _PlaceAdState extends State<PlaceAd> {
  var selectedAdType = 1;
  List<XFile> images = <XFile>[];
  final _categoryController = TextEditingController();

  final _parentForm = GlobalKey<FormState>();

  void attachFile(List<XFile> assets) {
    setState(() {
      this.images.addAll(assets);
    });
  }

  void removeFile(int index) {
    setState(() {
      this.images.removeAt(index);
    });
  }

  void saveForm() {
    var isValid = _parentForm.currentState!.validate();
    if (isValid) {
      _parentForm.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    Category? selectedCategory =
        Provider.of<Categories>(context).selectedCategory;
    print(selectedCategory == null);
    _categoryController.text = selectedCategory == null
        ? ''
        : selectedCategory!.title +
            '\\' +
            selectedCategory!.selectedSubCategory!.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Place an ad'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(PlaceAd.routeName);
            },
            child: Center(child: Text('Start New')),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 20, top: 16),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              selectedAdType == 2
                                  ? Color.fromARGB(255, 33, 33, 33)
                                  : Color.fromRGBO(213, 153, 18, 1)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () {
                        setState(() {
                          selectedAdType = 1;
                        });
                      },
                      child: Text('Personal')),
                )),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 20, top: 16),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  selectedAdType == 1
                                      ? Color.fromARGB(255, 33, 33, 33)
                                      : Color.fromRGBO(213, 153, 18, 1)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          onPressed: () {
                            setState(() {
                              selectedAdType = 2;
                            });
                          },
                          child: Text('Organization'))),
                )
              ],
            ),
            Card(
              elevation: 4,
              color: Colors.white,
              margin: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 16, left: 10),
                      child: Text(
                        'Add Photo',
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  AttachedImagesAdGrid(
                    images: images,
                    addFunction: attachFile,
                    removeFunction: removeFile,
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 4,
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 16, left: 10),
                      child: Text(
                        'Fill The form',
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                        key: _parentForm,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Title is Required';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Title',
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(
                                  Icons.circle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              key: Key(Random().nextInt(40).toString()),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    CategoriesScreen.routeName,
                                    arguments: true);
                              },
                              readOnly: true,
                              controller: _categoryController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Category is Required';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Category',
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Price is Required';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Price',
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(
                                  Icons.price_change_outlined,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Description is Required';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Description',
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(
                                  Icons.arrow_circle_down_rounded,
                                ),
                              ),
                              minLines: 3,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            selectedCategory != null
                ? Card(
                    elevation: 4,
                    color: Colors.white,
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 16, left: 10),
                            child: Text(
                              'Add extra data',
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Text(
                                'this form for ${selectedCategory!.title}'),
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 33, 33, 33)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    saveForm();
                  },
                  child: Text('Add')),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
