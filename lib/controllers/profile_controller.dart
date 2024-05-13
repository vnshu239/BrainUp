import 'dart:io';

import 'package:brainupp/const/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileimgPath = ''.obs;
  var profileImgLink = "";
  var isLoading = false.obs;

  //textfield
  var passcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileimgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadprofileImg() async {
    var filename = basename(profileimgPath.value);
    var destination = "/images/${currentUser!.uid}/$filename";
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileimgPath.value));
    profileImgLink = await ref.getDownloadURL();
  }

  updateProfile({name, password, imgUrl, email}) async {
    var store = firestore.collection(userscollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imgUrl,
      'email': email
    }, SetOptions(merge: true));
    isLoading(false);
  }
}
