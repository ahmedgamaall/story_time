import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({
    super.key,
    required this.imagePath,
  });

  final void Function(Uint8List path) imagePath;
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  bool imageAvailable = false;
  late Uint8List selectedImageInBytes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: InkWell(
        onTap: () async {
          FilePickerResult? image = await FilePicker.platform.pickFiles();

          setState(() {
            selectedImageInBytes = image!.files.first.bytes!;
            imageAvailable = true;
          });
          widget.imagePath(selectedImageInBytes);
        },
        child: Container(
          height: 300.h,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: imageAvailable
              ? Image.memory(
                  selectedImageInBytes,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/upload_image.png',
                  fit: BoxFit.fill,
                ),
        ),
      ),
    );
  }
}
