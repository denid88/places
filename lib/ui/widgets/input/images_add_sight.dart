import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/widgets/add_sight/add_sight_dialog_widget.dart';
import 'package:places/ui/widgets/input/image_add_widget.dart';
import 'package:image_picker/image_picker.dart';

class ImagesAddSight extends StatefulWidget {
  @override
  _ImagesAddSightState createState() => _ImagesAddSightState();
}

class _ImagesAddSightState extends State<ImagesAddSight> {

  List<Widget> _listImageWidgets = [];

  final ImagePicker _picker = ImagePicker();

  void _addImage() async {

    final action = await showDialog(
      context: context,
      builder: (context) =>
        AddSightDialogWidget()
    );

    switch(action) {
      case ActionControl.camera:
        _getImageFromCamera();
        break;
      case ActionControl.gallery:
        _getImageFromGallery();
      break;
      case ActionControl.file:
        _getImagesFromFiles();
      break;
    }

    print(action);
  }

  void _removeImage(key) {
    setState(() {
      _listImageWidgets.removeWhere((i) => i.key == key);
    });
  }

  void _getImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      print(image);
    } catch (e) {
      print(e);
    }
  }

  void _getImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      print(image);
    } catch (e) {
      print(e);
    }
  }

  void _getImagesFromFiles() async {
    try {
      final List<XFile?>? images = await _picker.pickMultiImage();
      print(images);
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 72.0,
      margin: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: _addImage,
            child: ImageControlWidget()
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: defaultScrollPhysics,
              itemCount: _listImageWidgets.length,
              itemBuilder: (BuildContext context, int index) {
                return _listImageWidgets[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
