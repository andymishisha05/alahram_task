import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class AttachedImagesAdGrid extends StatefulWidget {
  final ImagePicker _picker = ImagePicker();

  List<XFile> images;
  Function addFunction;
  Function removeFunction;
  AttachedImagesAdGrid(
      {required this.images,
      required this.addFunction,
      required this.removeFunction});
  @override
  _AttachedImagesAdGridState createState() => _AttachedImagesAdGridState();
}

class _AttachedImagesAdGridState extends State<AttachedImagesAdGrid> {
  String _error = 'No Error Dectected';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: widget.images.length >= 8 ? 8 : widget.images.length + 1,
        itemBuilder: (context, index) {
          if (index == widget.images.length) {
            return InkWell(
              onTap: () => loadAssets(),
              child: DottedBorder(
                color: Colors.black54,
                strokeWidth: 1,
                radius: Radius.circular(12),
                child: Container(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Icon(Icons.camera_enhance_rounded),
                  ),
                ),
              ),
            );
          } else {
            return InkWell(
              onLongPress: () {
                widget.removeFunction(index);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(widget.images[index].path),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> loadAssets() async {
    final List<XFile>? result = await widget._picker.pickMultiImage();
    if (result == null) return;
    if (widget.images.length + result.length >= 8) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('maximum 8 images')));
      return;
    }

    setState(() {
      widget.addFunction(result);
    });
  }
}
