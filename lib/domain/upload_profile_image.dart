// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:fastride/domain/firebase_email_auth.dart';
import 'package:fastride/domain/picking_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageUpload {
  static Future<void> uploadImage({required BuildContext context}) async {
    XFile? xfile = await PickingImage().pickImage();

    if (xfile == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Image not picked")));
      return;
    } else {
      File file = File(
        xfile.path,
      );
      print(file);

      try {
        String userId = FirebaseEmailAuth.email;
        FirebaseStorage firebaseStorage = FirebaseStorage.instance;
        Reference reference = firebaseStorage.ref();

        Reference folder = reference.child("users").child('/$userId');
        TaskSnapshot taskSnapshot = await folder.putFile(
            file,
            SettableMetadata(
              contentType: "image/jpeg",
            ));
        if (taskSnapshot.state == TaskState.success) {
          String downloadLink = await taskSnapshot.ref.getDownloadURL();
          await FirebaseEmailAuth.updateProfilePicture(imageLink: downloadLink);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Completed")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(taskSnapshot.state.toString())));
        }
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }
}
