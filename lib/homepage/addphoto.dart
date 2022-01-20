import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/homepage/sendphototofirebase.dart';
import 'package:instagram_clone/providers/addphotoprovider.dart';

Future<void> addPhoto({
  required BuildContext context,
  required AddPhotoProvider provider,
}) async {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      color: Colors.amber,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    choosePhoto(
                      isGallery: false,
                      provider: provider,
                      context: context,
                    );
                  },
                  child: Text("Camera"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () async {
                      await choosePhoto(
                        isGallery: true,
                        provider: provider,
                        context: context,
                      );
                    },
                    child: Text("Gallery")),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Future<void> choosePhoto({
  required bool isGallery,
  required AddPhotoProvider provider,
  required BuildContext context,
}) async {
  if (kIsWeb.kIsWeb) {
    // // code for web version
    // html.File? fromPicker = await ImagePickerWeb.getImageAsFile();
    // String pickedFilePath = fromPicker!.name;
    // provider.setPath(pickedFilePath);
    // if (provider.getPath != "") {
    //   await confirmPhoto(context: context, provider: provider);
    // }
  } else {
    // code for native version
    final ImagePicker _picker = ImagePicker();
    XFile? pickedFile = await _picker.pickImage(
      source: isGallery ? ImageSource.gallery : ImageSource.camera,
    );
    String pickedFilePath = pickedFile!.path;
    provider.setPath(pickedFilePath);
    if (provider.getPath != "") {
      await confirmPhoto(context: context, provider: provider);
    }
  }
}

Future<void> confirmPhoto({
  required BuildContext context,
  required AddPhotoProvider provider,
}) async {
  showModalBottomSheet(
    context: context,
    builder: (context) => Column(
      children: [
        Text(provider.getPath),
        Container(
          color: Colors.red,
          child: Image.file(
            File(provider.getPath),
            height: MediaQuery.of(context).size.height / 3,
          ),
        ),
        provider.getLoading
            ? const Text("Uploading And Posting ...")
            : ElevatedButton(
                onPressed: () async {
                  provider.changeLoadingStatus(true);
                  await sendToFirebase(path: provider.path);
                  provider.changeLoadingStatus(false);
                },
                child: const Text("Confirm Post"),
              ),
      ],
    ),
  );
}
