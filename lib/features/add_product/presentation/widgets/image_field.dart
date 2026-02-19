import 'dart:io';

import 'package:e_commerce_dashboard/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading =false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return  Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: ()async
        {
          setState(() {});
          isLoading=true;
          final ImagePicker picker = ImagePicker();
          final XFile? image = await picker.pickImage(source: ImageSource.gallery);
          fileImage=File(image!.path);
          widget.onFileChanged(fileImage!);
          isLoading=false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyColor
                ),
                borderRadius: BorderRadius.circular(14)
              ),
              child: fileImage!=null ?
              Image.file(fileImage!,
              fit: BoxFit.fill,
              ):
              Icon(Icons.image,
                size: 150,
              ),
            ),
            Visibility(
              visible: fileImage!=null,
              child: IconButton(
                  onPressed: (){
                    fileImage=null;
                    widget.onFileChanged(fileImage);
                    setState(() {
                    });
                  },
                  icon: Icon(Icons.close_outlined),
              color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
