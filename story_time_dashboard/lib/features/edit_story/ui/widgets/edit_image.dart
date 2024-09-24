import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';

class EditImage extends StatefulWidget {
  const EditImage({
    super.key,
    required this.imagePath,
    required this.imageUrl,
  });

  final void Function(Uint8List path) imagePath;
  final String imageUrl;
  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
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
              : CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                    color: ColorsManager.darkBlue,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
        ),
      ),
    );
  }
}
