import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ridoo_driver/ui/helper/app_colors.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';
import 'package:ridoo_driver/ui/helper/app_spacing.dart';


class ImagePickerDialog extends StatefulWidget {
  final Function onImageTaken;

  const ImagePickerDialog({Key key, this.onImageTaken}) : super(key: key);

  @override
  _ImagePickerDialog createState() => _ImagePickerDialog();
}

class _ImagePickerDialog extends State<ImagePickerDialog> {
  final picker = ImagePicker();

  Future getCameraImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image != null) {
      widget.onImageTaken(image.path);
    }
  }

  Future getGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      widget.onImageTaken(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget dialogContent(BuildContext context) {
      return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(hDimen(10))),
          color: AppColor.colorButton,
          child: Container(
            padding: EdgeInsets.only(
              top: hDimen(25),
              left: hDimen(25),
              bottom: hDimen(25),
              right: hDimen(20),
            ),
            //height: AppDimen.V_DIMEN_350,
            width: hDimen(300),
            child: Column(
              mainAxisSize: MainAxisSize.max, // To make the card compact
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Add Photo",
                  style: TextStyle(
                    color: AppColor.colorPrimary,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                AppSpacing.verticalSpace(hDimen(20)),
                GestureDetector(
                  onTap: () => getCameraImage(),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.camera_alt,
                        size: hDimen(30),
                        color: AppColor.colorPrimary,
                      ),
                      AppSpacing.horizontalSpace(hDimen(10)),
                      Expanded(
                          child: Text(
                        "Take Photo",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: hDimen(16),
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                    ],
                  ),
                ),
                AppSpacing.verticalSpace(hDimen(15)),
                GestureDetector(
                  onTap: () => getGalleryImage(),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.image,
                        size: hDimen(30),
                        color: AppColor.colorPrimary,
                      ),
                      AppSpacing.horizontalSpace(hDimen(10)),
                      Expanded(
                          child: Text(
                        "Choose from Gallery",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: hDimen(16),
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ));
    }

    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: dialogContent(context),
      ),
    );
  }
}
